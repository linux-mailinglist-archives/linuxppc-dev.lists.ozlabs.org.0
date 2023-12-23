Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403581D647
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 20:26:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w+dL+yWC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SyDgV4qSLz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Dec 2023 06:26:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w+dL+yWC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SyDfh3XNHz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Dec 2023 06:26:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703359556; x=1703964356; i=markus.elfring@web.de;
	bh=8Z2UWZfzwEDJ7zyg5026yhkAS0hTMuV2wF4BEAAq9kI=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=w+dL+yWCLM6X+HaJh2oItzSSX1H79xLKCaupBzYgnLqakND9pp7hYoReE4n2i/ov
	 WnguDWbUA5oLYmNFvotgXWiO6el5aXsIVaYn4fILKEqsvICP94QMsb0NZfFAnTFc/
	 hUIQ8xO2oBdF15VBo0uyIwcobH2F21B+Yqrw/BYD1pvWxBw0n1uJeO2W/OT7ZQHMg
	 nXX4uPEkMR7G6lQ62TOFBbUjfRsFzVGYZ/Bog7c+Cx3AuSJl1XfMp5jiq0J+8rwd5
	 MIMsckzRqoLs33Ls5Rnbm7/v7RcZEStsF1+uTDRll2mhiEluPzzJNjEEVm6RA177e
	 DPy73vKKKiVEmVu8aQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N14ta-1rA9Gk1bMA-012k71; Sat, 23
 Dec 2023 20:20:24 +0100
Message-ID: <1f1c21cf-c34c-418c-b00c-8e6474f12612@web.de>
Date: Sat, 23 Dec 2023 20:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] powerpc/powernv/vas: One function call less in
 vas_window_alloc() after error detection
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
In-Reply-To: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PUZbbeRbt872OFeEXt9lEIn6ld+RqZBajG+dMGfiFv6L0AVghxM
 EirMQ786ltRpWXGQhVE0xl7H5xadbtnvbZb4IQsQOPy0Wb6/4zdbbuUHYoLQdG5mWhHBw0I
 zXGAz72cNkVS2hENSQ69tkYsbF3syfbS8S957H5pltWdGr6Sb1HVau+idUfaoxGy/Kv721n
 bUFHjuaFVb4uh9UggISBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C2hApiPv/HA=;H4d5CiGholiTZynSU3/po8EIcKV
 XU10G3snYdmBJUnzCNk40EE31NDOAMoZEx2BGKRt1yDRO1a1ecJDJyTu9y3hchG5PhhEhS61q
 Yw4QRtaEqjM/H4+u/FdJSp0wDPiwy3o0gabE8MYZ2zjEMA4AK+EPKMK4Bg63vkbCpSfMX8G8T
 sr4pTaAsof26rBkfEKLCrbBTAVrkQkiX7Qkco3S3e9Cs3dqAbfSsu6cuxGBz+RTqQgqwypGyx
 Kw1lfkxe+lMTUT2bq4zbfxiXFk4j9qNAR8PMhJcnzKq8ACWYOXrE7rkZgt0+Ou064s4hThBP9
 R/M3Y9nKEc7xxjazgVNOW3r24fW2jK1J/jMhIwmSwkknXnLEyvsYRFKQxfFz1RCZRHLqAsyDX
 Rdyexlpw9rp7x6GCczq1vi9NpM+ruCDlhTCjih9dezjMIT0+k3lIRM9XexsAsMkt7I0xVhMeO
 +bBnHODDNTuWoAds8RVGEdf2lk+at/QPHlCfgPUxgwrcRNqCSRkzDr8W3bwWfZc3cwdnX4uJS
 TptgAlJHc/jDkOMQ57e26sGe3Ier+jbX4sp2rEWQizKCG6H7A9mJL6CpFnHb82e7Mqc4Do+8S
 1bI+o5Q5IOJLwBubicuMAqYIc9LxMwe+R/FYM4PcQ5of320RCjnROEpn8fBAO68qL3JesZqAn
 +3o40k3c+M/wRxs4KwgkOA/ACT1bsJn6tV/hZm75QFkj3E/r9NVgr+EABbEjiM8G7IwoTEArB
 +p78JBoHvjvX/aE0c8kwO4DbZWXDCTl12YBDJ9ed3myalKMQwte7VoWmh/kwDoE0ss1aPpyWJ
 56DhMqGEBgUjQEiotBUPNO/IrzmNNYVCBl54azAc7mesWwZUCcrBRNp0Nz/c6CZAXPBMjrmmo
 9RnbZY07gMOYMCNxG4/wJlU8jOHQWVZCwMkhaRZxskZaJbuN6EHrZNdXesL7y2QT05vB+idj7
 DgGqZGfYsSolXB9vwQP2iS0dhk8=
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2023 19:35:13 +0100

The kfree() function was called in one case by the
vas_window_alloc() function during error handling
even if the passed variable contained a null pointer.
This issue was detected by using the Coccinelle software.

Thus use another label.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/powernv/vas-window.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/pl=
atforms/powernv/vas-window.c
index b664838008c1..b51219b4b698 100644
=2D-- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -545,7 +545,7 @@ static struct pnv_vas_window *vas_window_alloc(struct =
vas_instance *vinst)

 	window =3D kzalloc(sizeof(*window), GFP_KERNEL);
 	if (!window)
-		goto out_free;
+		goto release_window_id;

 	window->vinst =3D vinst;
 	window->vas_win.winid =3D winid;
@@ -559,6 +559,7 @@ static struct pnv_vas_window *vas_window_alloc(struct =
vas_instance *vinst)

 out_free:
 	kfree(window);
+release_window_id:
 	vas_release_window_id(&vinst->ida, winid);
 	return ERR_PTR(-ENOMEM);
 }
=2D-
2.43.0

