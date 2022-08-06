Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50AF58B57E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 14:30:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0MHx4M8Fz3bvd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 22:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Q7H8ItP4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Q7H8ItP4;
	dkim-atps=neutral
X-Greylist: delayed 316 seconds by postgrey-1.36 at boromir; Sat, 06 Aug 2022 22:29:32 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0MGh5SvSz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 22:29:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659788969;
	bh=UovwDaLyuTgPejCzTK254N9IC9/vqRLIfV2J6pi3cos=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=Q7H8ItP46o8LIoJDuh1iGlOJ5y9GGgazEK7RJYgT/DOTOkrrXAAyDVymYm3uVC1ke
	 mq7tQhBF/3U0+TBPL4O9qMwB+HMN0RzS9r2lJWLX8f+H09nvaSsyEkhN16DEfxY+Wx
	 kEWtF44crocOFJv61b9r7otV0N1ZkdjPWHVrz8NY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.170.46]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4axg-1oIePp13Oo-001li5; Sat, 06
 Aug 2022 14:23:51 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 3/3] x86/fault: Dump command line of faulting process to syslog
Date: Sat,  6 Aug 2022 14:23:48 +0200
Message-Id: <20220806122348.82584-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220806122348.82584-1-deller@gmx.de>
References: <20220806122348.82584-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H01j2TQ/vI8Y6o0FFlkaFoyN427aLLFHAXOwrAp0nDGTiiV7Nq+
 uCJbOe9koCgQtLpU+9nuzPCG4KZT80QhBUZIcSt8TR3Db2qFjWxViCvSQwg8RhzhInCmpzZ
 eBUxsUKfOuB6yt9DaricIZfE20DESfPdSECZhDaFmcR9xcYAqzupvYwEa8fNw2k9cHRdiu5
 G0mvj5ArxQ84YO5uGzIjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQUPXiTU1I8=:7PKtSH8ndyXks0Q4J5/42M
 6BpD/Zd0iosHv8OqgklN44LS3iUMW2oPpidPXm0KMCZ0gyyhOxosZUw8pLcrvrD2ALtv0QLdY
 1m08/9pWeBSSs47OFgKTNuuRaQ7E7xDb4wF2bM7IMf9bXD7x/u0T4ws0ArPywnYvSCqrezJmo
 vqyPY2soK5y4W6M4pIHuYw0L+8sAbbPKVY27gRwGI7TN0lAeLJX7KBcaqnxjCjsbev7qc5UH3
 p+vnlwo1aiL6ahbbkjVXyh5X3V8X/K4gNnPl2IX8uZgWSYwLkySDeUJr4vDFypIOf3qrqt8QK
 0aaWu6WWyHkWJQ3ODUJUy1CE7khrCwx6+34hjASVcN7bbyTmgfLV491LaAOdvanzRZZ/ZsvN1
 UJ5yiwvwUO7OeeA+F+QZRzKliv2GfFyrci/EVLmV+m9KzPXtzLZL82FM4iq8O8P11BdP/GRN0
 N+8c9gjbqinA4CIhL/WouyppqVD/jcKaQ+0Oe9sIHzNPX0fgtji0o7hxbsDrZrQQhBuyo64O8
 s3TbJoAQCcTgdUYh5cc/wd84JAk+HUKSC7003yigVqYbxJRNa2ios0l+ASfdYdY2jZJZ6Iwj4
 7nvYhdJzMgZgogC5ie7vemRr/5KMH++F4LgnxQ9ajPg3K68jy5TttpKkahZmDBlAsJ+kic2zq
 Tw8YPvL0Lc20jBSDSX4AMXHdJPINUYPZlwf7smHAXzjMm3Hw/e9E2i03WY45IRPoyVMDzi7fo
 0adadltlIT8ZvDI/CNUzi9SDgtxgIGHDL5Ye6TF3bPvmM2jntZZbRDEoHc+sh1c1Jgg+XNiLq
 8DJ7SpgcvLfgQkQNFdN1NwsB0XOuRJ6Pv5fVoh+78x0Wo1CJ1tjp5Hs0jq13gfRMfXJTTvG+m
 WFMHb6RLsOVSkitvRTBcq4NEO2dOAgaCSgh1LXZGJJHBoC/9mlPB1rcj7dWMcDqOEiZiLiMzw
 F5GMDMhmiDCT038IUtnU4GlXtM4GwXjE6W5epaqOvRQ6tpiM4LU2Fe0uYl0tmtUdJxpLAqq6u
 y6J9R6lQrrUYWGmOTA2ELcvSbYwzWBt3xwN6TS6ohxY+KdqEx4b8e+NCihjuywZsYza7u7Svq
 DMBHwd/hSbT622rxDOAR3p+QpDAbC0n74J8NWxUyPaAGu+Stttu63m2dw==
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
f 80 00 00 00 00 e9 7b ff ff ff 55 48 89 e5 b8 00 00 00 00 <c7> 00 01 00 0=
0 00 b8 00 00 00 00 5d c3 0f 1f 44 00 00 41 57 4c 8d

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

