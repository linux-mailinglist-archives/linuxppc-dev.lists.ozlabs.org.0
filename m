Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FB58C925
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:11:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1c5b5lgtz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 23:10:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=cF2sSQk2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=cF2sSQk2;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1c4J0ztfz2xHS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 23:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659964159;
	bh=P4saksYO9CTgO6X6/2ySNBwjHK+p2F8Ba3kmdgwmNIo=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=cF2sSQk2IC+/YLMkYSNiIW3FHdR6BCkRcqQvX1zhiuPVvJZQL1UrHfQmOVUTMjj6b
	 FvKwio4C8cpMCRUi04gaB1KTi2Ids9kAGjqxILLng/okGBuz5QsyMdbuxqYSgSAwQP
	 Qei1jnz9/jUKpFiS07EcRGUNeydXObY4538BoBpg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.169.184]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiaY9-1niySX3wFb-00ffdW; Mon, 08
 Aug 2022 15:09:19 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] x86/fault: Dump command line of faulting process to syslog
Date: Mon,  8 Aug 2022 15:09:16 +0200
Message-Id: <20220808130917.30760-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808130917.30760-1-deller@gmx.de>
References: <20220808130917.30760-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:louBvz2yR4jkTgo627u5H+l8UG9i2dYFkwpu3hE4RDyH+SAv5gu
 1uZi8tHKHiOS2z+aIDclKc2Gke5YpmvooMGsYPIvvTBUDLFBLu/XMyZQ51/Dtejtxc+QadJ
 l6R1uEv1BxzjnjwzGKJ4+JSXGHaEQP2kmpKZEATjwMbEGaQNBgoF7RMSFNCH1Iuy+qHsS1Y
 OncxQEUpqyh+9TkLLFcSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/dBBLCq2604=:Ce+jE4umdoxfrr2xtC6+FD
 9O3kqH7oa2bzIwUT1YYtDtTQEvjEhaVKo2L2/eGbT2IbjEdhpirm9T0qXwaS8uzvrD0FJRIZw
 /EODphFxIOJGzVw0fuYQHZI0ZAcTtBvojZlM6yyfpiwjh763kbKp0Nf4Kd7uDOxmmxxMPi8z1
 GtEVaE22A/cY3CrMzlAFTGLJNVTdithhoPSKmMH+H/dspYeXPBV2te61wq+6GMKdCeOXoHoZ6
 X9tIc3R78hZroZXnxNxMcztgr+/i+mIq9/myRT4TyMtkMDy/CMLQggqNDipcpP7JsSI+XhHVy
 aTXC/MVoaFadlbKPnAXgxXbmQLdaOcGu0mTD9WB5CRuEkUTEx9pbcVBnvf9nnTSo1tgcB54GQ
 567YrvWzPXosPGu/cayPmIwVVUSNuZ5zr1yXeDUCI5f8HQMBYBmNbUAMkikIL5kVcDbYb2YMI
 hNSrCk47oZ4312cFwP6Ud7d6KoA+kYK21Q4bp8tIX92kpBMRW6WSdhcV268wixbT309dQWIxa
 H96ZcddQnEkOt3jcj0aMzqLSLYQw766tL+/KjfAdR7l3jFSj3Yg2DI4yNicwrEEkw8fJWv7rl
 wlKXHWUczVdPUWBRlSn74V0ntrGghvFD2o3+klrzp2tY/75CdWNFrNg+Cd6MNRg2CUqLr+VA4
 5N38FHRPGmXWuLUWZDkWdzThpuUS6illt8HujKcgyWlFXZiXcicnbYZ3OCeCdSNiGExN+nQ2U
 lQc8It9Q3AO+9RcxASCHGZyxWdLd33hXp5SYtUiH7loorc3dPaUVSZNaGjb26ZoeXKG4PngWv
 Qbn5/7A27Ug46B8O8gzQnTWVbneEpJQyQ4E9pt7UPQCX4aA/bNl5Rf6JtMXV3KomiAtQI8wiA
 zKWpWLt+Bs4NHtMzYP17ep8v+W43ADKf5lXrKD/phCMrFWOU3i4o8lArtJrhlBLr9k9wqag9+
 j3NTSY6pz1A76oLcPNwDbU8xLvf/BNEOt3eoYWmpQrcCFYHbrcdsNw1ManLkSIbzQpYAWPVL5
 wRfSd6lP/K6CfEQwK3n2ktHHqe2GTe0zSmwdXf9KJWBXstn+yqCCXmfEcDClvc4/4VSwGiEFs
 G6KUCv0LJ8uIV1Qq5IN99V1fkf+BU2+M+iYVSsIq7Wft3PA+QMTNnNh9Q==
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a process segfaults, include the command line of the faulting process
in the syslog.

In the example below, the "crash" program (which simply writes zero to add=
ress 0)
was called with the parameters "this is a test":

 crash[2326]: segfault at 0 ip 0000561a7969c12e sp 00007ffe97a05630 error =
6 in crash[561a7969c000+1000]
 crash[2326] cmdline: ./crash this is a test
 Code: 68 ff ff ff c6 05 19 2f 00 00 01 5d c3 0f 1f 80 00 00 00 00 c3 0f 1=
f ...

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/x86/mm/fault.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index fad8faa29d04..d4e21c402e29 100644
=2D-- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -784,6 +784,8 @@ show_signal_msg(struct pt_regs *regs, unsigned long er=
ror_code,

 	printk(KERN_CONT "\n");

+	dump_stack_print_cmdline(loglvl);
+
 	show_opcodes(regs, loglvl);
 }

=2D-
2.37.1

