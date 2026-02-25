Return-Path: <linuxppc-dev+bounces-17142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDXxBZmOnmmxWAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 06:54:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A8192317
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 06:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLP1K4S6Fz3dLW;
	Wed, 25 Feb 2026 16:54:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.84 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771998869;
	cv=pass; b=boLTBMBzHi5/c+WWZit4ycF3inBwjF94ck17m+GGImOJsoQzq7GPmzC8R1neE3bmOusX0Ztqf3Hsl537Qe1RtpchFbPuJJ1/oQUMlN09v3VDsoPm9rU3Bad3wm0h5U47sqdnCUICVS1sTqFRihHByW3165F4TMA/ZmmjKlgxPzK3u3bmcYE4oyx+uKCJcSwUEmWRhLb+2vxX+QiUMpf2Q2YMgpMjRekMG+xpk4kDoY/vpc3uJXi3y2jOg9xBbKbukEjkm5Wol90dbT/nfQ9Hl5/Q8YnVfmNVOJRxCrv4vYb9nfU1B4TZ7OCGovzsOiLhWvAD78y73ZuNVUOjbkWoUg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771998869; c=relaxed/relaxed;
	bh=3J8yb4ZFpxh+YQdeFpqiF3RdlnqhNeRthSTVU67WHT4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EZDmUFYRMM3G8wiO0TQRsiQ9cGWYYoZhAkkeZ7JyQtWKY8rtMfpw8yE2gswYvrsw8zwu8I5Hfuyuzcvgk0tvGe9OiO9zzaQYmlUEJh17HBxf4FC4+lZcEHa1wjQJv4Rq4Tq+oWhfnWwlEe/fHw2AOztlQmdgX0H4NqJ8baT11Zs4aEReI2qz9hS45STOInEpaVX9sXADdyUkP3s4bTI7fAoHbmQdTXsHBaEDqOCkEFuwtpgHjm8iMhV2Nl1gtTpK3sZKS00Lmj0qMO/TftD2BYmJY9ousPI9L3oa+2hAOheD+JEvzTi3pW/fSvEHhEpuJFbbTUgZF/Cw/ESO+MlLVA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hxkttRVj; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=aBMasJzn; dkim-atps=neutral; spf=pass (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hxkttRVj;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=aBMasJzn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLP1F4R4rz3dLS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 16:54:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771998858; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sdiIGYYv1a444gdfmlZtc7objuzX1oShx+taRKn57t31gegnJCNFpNB1xV+MdvA6/e
    cmbPL01dZV44ezxXPUn63EiWghA6fvxiMAoDq9YSCOmsXO+6/YXcFlf8yTzq0xo8R70s
    vLogdKufK97redB2qyoUHp5i90u1LdZ8iR44VjJx5OfsGUtKda2d4TQBXe0B0z8+lb1W
    zQPZ9w/2RAh7DmnTjMPbnzYsiAZpUsiG1p99Z8xu8D5OkfawI/DJgkK09QUduMzIdwaF
    0d9vxaHczNb0/6Ao5bKBAdJhb2LfwWumP8rTRf9g70eF49oZSUjNyBJE3EZ528N0BLGg
    owPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771998858;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=3J8yb4ZFpxh+YQdeFpqiF3RdlnqhNeRthSTVU67WHT4=;
    b=s+yfPOKpL9YwgvPpED0PKwhIABzx2yzE8+XB+G0i4/PH6WpeMFSAvFzqtTo7ErCm0c
    e9VaEDUS64nfzm2vZ3c5yfUNLltKt5APQleYCEhmKTVPdrpJv3LZR/Qm6jhEjEf1fZuw
    us5cygeloaSYjK4SJ0zPZEIwrEdTclV5gVdLs4gn+q2DNP8/5i8W0GWCXwhdb7N5IKxd
    wLvmhSAn4anTAYRwsfUpGRVB1r5+N3GXS1KLVEUVHWfdgqjh6eE8AIcqysVE6ZBMAyza
    8+g0eBAt+A/t7LbtZTPXF7afmFsOrUtKakMZRXBZfYKN34hGu3agppwnKPxi1jztO1nH
    zuHg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771998858;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=3J8yb4ZFpxh+YQdeFpqiF3RdlnqhNeRthSTVU67WHT4=;
    b=hxkttRVjNBeg0RN0a+6yV5+CBx1XBkcyleYnG9BZgcDxMSPTjfdQnn/86voQFaqQLn
    UBZKrgmxxqv3UhF2666MRkw0YgsncG96/QDrm/m4v57M5pUvx2YlZmibuVT27AlXbHZz
    tLzMHPWX/UhHQP/Q1i4pSKP/ohmgNZzTVa4d8hGm8UetKbfCjxGhiTY5q6GNcDZnL3iA
    yoJdwjTC8Hc2//JS/lP4uXw8n+Q1407vNjnJE4/D0acZ6GEM3++5gbyjYPnWyiBSKc6h
    IpOF4G1oaDsMaxJ/2bM7fe9hMLjVAMcafQ2BoFcqbD1Q406E4HPMXlIUyAguWVMdJDso
    kqFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771998858;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=3J8yb4ZFpxh+YQdeFpqiF3RdlnqhNeRthSTVU67WHT4=;
    b=aBMasJzn7tIlwcDMfLbDGXSA+jp0nLoXMMOuFiJeqeBOksriblacqeH34OYKZpzfFg
    YZKQGenqcsNbCwo335AQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+l7xrg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21P5sHpTc
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Feb 2026 06:54:17 +0100 (CET)
Subject: [Linux PPC] Disable PREEMPT
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <e425cd24-e19a-3860-aad2-11e91af8323f@xenosoft.de>
Date: Wed, 25 Feb 2026 06:54:17 +0100
X-Mailer: BrassMonkey/33.9.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-17142-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 284A8192317
X-Rspamd-Action: no action

Hello,

We were previously able to disable PREEMPT in the kernel configuration, 
but the latest kernels now enable it by default and it is no longer 
possible to disable it.

Is it possible to let us decide whether to activate PREEMPT or not?

Currently we use the following revert patch for our non-preempt kernels.

--- a/kernel/Kconfig.preempt    2026-02-14 10:06:32.000000000 +0000
+++ b/kernel/Kconfig.preempt    2026-02-08 21:03:27.000000000 +0000
@@ -16,13 +16,11 @@ config ARCH_HAS_PREEMPT_LAZY

  choice
      prompt "Preemption Model"
-    default PREEMPT_LAZY if ARCH_HAS_PREEMPT_LAZY
      default PREEMPT_NONE

  config PREEMPT_NONE
      bool "No Forced Preemption (Server)"
      depends on !PREEMPT_RT
-    depends on ARCH_NO_PREEMPT
      select PREEMPT_NONE_BUILD if !PREEMPT_DYNAMIC
      help
        This is the traditional Linux preemption model, geared towards
@@ -37,7 +35,6 @@ config PREEMPT_NONE

  config PREEMPT_VOLUNTARY
      bool "Voluntary Kernel Preemption (Desktop)"
-    depends on !ARCH_HAS_PREEMPT_LAZY
      depends on !ARCH_NO_PREEMPT
      depends on !PREEMPT_RT
      select PREEMPT_VOLUNTARY_BUILD if !PREEMPT_DYNAMIC

---

Thanks in advance,

Christian

