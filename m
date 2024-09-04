Return-Path: <linuxppc-dev+bounces-984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436996BAFA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 13:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzLDN1JsDz2yVb;
	Wed,  4 Sep 2024 21:41:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725450084;
	cv=none; b=dskQpqaj/JTfPASCncZiW9c24HO5F7HUzDRJijhWO8ZluEnmbdnHBWSzb9E80Ut1UF013v4n0MVM68oYuNT9bF2a4f3etSSi1Y/Bt9gqHRvxVfEycVDpCoPreRfseZpnLqogynH5WUcskwvxbs27PMyD2Kzot0grjPpsb9I4i+MO2Up3jDCIMSm8o4lP/GwebXZy0D7xEpAjxx5XCRk2oZ0D1R8pAAwFIQ20HjyScHT7xc6iez40v6KBQLohrNCCO039swNIa3EoqZt9aEbp1HihtG8wFWJvWxlAOI+R6Jvrjw+P7OmYuH91JhPYCEqq0+kHZcpwCLKhXob7uUpLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725450084; c=relaxed/relaxed;
	bh=JUtDkRQIixiWUpjVIxkWmdBLg4BxoZDRzCOPxlmz6VA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ELmpzci7kKxOo0rMUWrrpiG+j2M0KXjK4iH3n6A+6njj0lrmFBB4JI9AYqttp+BlRAHdoPxmpcrnq/prjeQOuHNY1jdZuG7zhPtmP3iB/rel9U9pL0tNFrT3o2xQ8HyjrdwLOuXbhnA+BrolGclztF2QzlAXwYmoS5kM6bP+joLouMNDtPLu7R97bv9Y/kELuOpRvyIfZM8EEbaV4hvI2PiPviM8b684/cxd+aEAkthA8okqXcIwVkrw3QPkiVi24b0rx7ZG/eoGCK/mRFuE/WFtPpxnsvx9EErpOV99J9JNwYsSwTQQcsZq+Q5dQPBKVpNuyB4Qg/wkC988j/q5KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzLDM64Xyz2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 21:41:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WzLDH5M27z9sS7;
	Wed,  4 Sep 2024 13:41:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUxpvlBysyoS; Wed,  4 Sep 2024 13:41:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WzLDH4b6Gz9sRr;
	Wed,  4 Sep 2024 13:41:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E07B8B77A;
	Wed,  4 Sep 2024 13:41:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id EpWSv8U77IeF; Wed,  4 Sep 2024 13:41:19 +0200 (CEST)
Received: from [192.168.234.246] (unknown [192.168.234.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 478688B778;
	Wed,  4 Sep 2024 13:41:19 +0200 (CEST)
Message-ID: <30e9575c-a53e-4e17-bbbd-7127798efb05@csgroup.eu>
Date: Wed, 4 Sep 2024 13:41:19 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr-FR
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Xi Ruoyao <xry111@xry111.site>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Profiling of vdso_test_random
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm done a 'perf record' on vdso_test_random reduced to vdso test only, 
and I get the following function usage profile.

Do you see the same type of percentage on your platforms ?

I would have expected most of the time to be spent in 
__arch_chacha20_blocks_nostack() but that's in fact not the case.

# Samples: 61K of event 'task-clock:ppp'
# Event count (approx.): 15463500000
#
# Overhead  Command          Shared Object        Symbol 

# ........  ...............  ................... 
....................................
#
     57.74%  vdso_test_getra  [vdso]               [.] __c_kernel_getrandom
     22.49%  vdso_test_getra  [vdso]               [.] 
__arch_chacha20_blocks_nostack
     10.80%  vdso_test_getra  vdso_test_getrandom  [.] test_vdso_getrandom
      8.89%  vdso_test_getra  [vdso]               [.] __kernel_getrandom
      0.01%  vdso_test_getra  [kernel.kallsyms]    [k] 
finish_task_switch.isra.0


Christophe

