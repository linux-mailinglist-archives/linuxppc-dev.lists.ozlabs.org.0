Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBF5523C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 20:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRdKj4JXjz3cgL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 04:22:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Q7uYpdup;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Q7uYpdup;
	dkim-atps=neutral
X-Greylist: delayed 331 seconds by postgrey-1.36 at boromir; Tue, 21 Jun 2022 04:21:56 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRdK04Gt1z3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 04:21:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1655749306;
	bh=IRsReQcPvKjGuOiWZ/naJXtB5sl9AWyUBgzpYTxhbu4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Q7uYpdupYPEvPKNSIfmC+5fXdVLE1gPHv3pNqqyyj/wJJqT3rjgpPZh0rUWmfBfZ1
	 empNv1i6JgWVNUt8SgbxRZKbihhUGN4o5CmmXslXJnU9QcK55/OOwhQS+QUS+CDacm
	 X5mevFAGgE+7q8vTZZ1xsaJWiOqEfBOMPT0+r5Qc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1nbB703cd8-016vo0; Mon, 20
 Jun 2022 20:15:56 +0200
Message-ID: <4bf0f587-e03f-60bb-806d-383cdab8f67a@gmx.de>
Date: Mon, 20 Jun 2022 20:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] video: fbdev: offb: Include missing
 linux/platform_device.h
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 manoj@linux.ibm.com, mrochs@linux.ibm.com, ukrishn@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, tzimmermann@suse.de
References: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oJ9D9uGth3QBUylu+JFhLcVTIwUeAyZlFlYU4v/OPaS0ZpMihid
 tFsd2Tanp1YkXXsADmZD7gloGpa+E8c77bFVGDTOIbSoHVGGXqjDnhlG9X2kTmyAlcnkiUl
 YaAKGLHLr/7Cwe1Lwdry13RBpDCqRwRDdC+6HA3J7Kwgih+MFmqOSJeeQQotfiAjelWovxP
 NrTUJ0YmY4qRCYYTkWkIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MPVe9UIYQFU=:Qr3kri+7CyQ7iJSIimJ1+7
 14qMMlY0/y23+oi3Ko4uTlyB7VNYuEQfGIp5afPNn8YFSvJSwRc1v78B2chz22T6Ttjp9sBtj
 F1dpPyzwUsvm5uf8ju+9NQW7tndmazbCRmDXy6UOzK94AA8TkHZ5bxdMq4RZ20sieS/Nulhv/
 QR9/S2tH/OYgCe2ZjhYS/rOof6fBIlrp6TkpQTurBWd5eVck8xqznXfOH1/+1NhlFEl0uvmYC
 Se55vqm4RFRf6dxxXf+pdJjCfap88u9SfCd6sj2sDeSLsdUJBxYKJuS31BiAHDEU9GbIip+eK
 fOsXe2L0ZprQVRCw2Z8xX68SdnMOeRRNxqwwaa3KtzIsXIPNcmq4e8QmtB36pVnSoegtN4fgp
 rx0N9DoRZgR+8Kxhb87X6al5IsiVwzikmK/0YMds/A+rGEFuhVllQTL5gsGMDpAru4UUP8VTl
 6/EzEmbu+ff8ygOYYA0bhQ5IE0amRbKkpVxBeSlCDqixyVkFOM42akWx4tDHjZshrb0Y/MPWt
 bVv63VsChXPFm1aHi/Y3XgbDcIyTnAztsY95rzuQ0ZIY5SsYu/Vs4eEfEZat4N9eFARIjW1SP
 HY2wjzhF+35gqR40TclD9ctBHrjXVa+nwTiD6NCChGWaPASkcUbnyK5qYeDVn9f86hEvwA5hQ
 lqsXmnNJYtZlhbZPv6Y5/FdqsMCsZ1lPQI/4nWxv0HvHvFoBtA4uKyFVsI07fz1ub36Z6K6aa
 PsF7ke+5o0HlEPdk6cQt8E54iNRA9aMMs+sXZWf5xzJUXK6z/EOcF+LfV9kMI1VfGftAMXEb4
 fQByYroEiPy+KVm2qBl/btd2ga8jDUdKbarpyVE3C0kw4hpqQ0Sech9k3r4X0qk+vVi0Z3kiX
 eLb/1sUyX2/L+WYd8QSe6T1UAmrjtufA6tcKa5crCb/sJZbuWAskDdP6naQbRe0NAT7qzvMh1
 TpeCorfdfQeNPfG+kfImrP/GrT+Ou4A21RPERLhpTPmjgAlX184F9/Ur0w3Pha3WLabY4QQai
 xFtcxV3l7snG+tGMU3okgUlSe+QSQQCIP+rHMJEcVsbj8gkegcUdYphsSo8tPF0O49elZU/Pk
 vLJOT3ArC8CO4jQ+mUQ5Ua+UhY7QYHpZaMIerXPn0PaXKa4XlMchauMyg==
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/22 18:50, Christophe Leroy wrote:
> A lot of drivers were getting platform and of headers
> indirectly via headers like asm/pci.h or asm/prom.h
>
> Most of them were fixed during 5.19 cycle but a newissue was
> introduced by commit 52b1b46c39ae ("of: Create platform devices
> for OF framebuffers")
>
> Include missing platform_device.h to allow cleaning asm/pci.h
>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 52b1b46c39ae ("of: Create platform devices for OF framebuffers")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Helge Deller <deller@gmx.de>

I assume you take this through the linuxppc git tree?

Helge

> ---
>  drivers/video/fbdev/offb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index b1acb1ebebe9..91001990e351 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -26,6 +26,7 @@
>  #include <linux/init.h>
>  #include <linux/ioport.h>
>  #include <linux/pci.h>
> +#include <linux/platform_device.h>
>  #include <asm/io.h>
>
>  #ifdef CONFIG_PPC32

