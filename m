Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4228E591
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 09:33:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468J8v2P3DzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 17:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H9fLupZW"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468J5D3fCvzDr13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 17:30:23 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n190so974112pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Sm9TAmkSpAhUtSYfkqdqY81YGhX5MdgdcjDuv5xtvoE=;
 b=H9fLupZWXgITRZXBBVP5vaTvYveIMd3FTlV529biKXxqImSQNMH8j3Zf9KBVWG/BPK
 5AP80vBT9s4RRuD1Ii9UQHAjyVTwovrZTGU1R7vIvroBaqlC/ODzgvs+o9WFnh6Idtzq
 M+Je3yWQ9F12isplm5kXB9Q2sBViuM9ct03YKLEZhn1KQLRgMP/PwwxLQg2P2yXBhvzp
 9VFdg35EjbtkwtOydrsIsHLELTEyH00QAdLsRBX3SBYAQ35IktGLulQYmW6SOHXIRv+z
 c2qUS5S1uSRuBu/yfI1K9bVGWbDIdNqx8ADsOr31rWdByaJU7/dbDQCg8N3b/vQiKQrP
 idDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Sm9TAmkSpAhUtSYfkqdqY81YGhX5MdgdcjDuv5xtvoE=;
 b=ccBOWAducmu4qLs+MchnSmsirbt5QMPhI5PacCBHwlq9e8cn3l6R4rxFcFTdkj/XAc
 lwhY2QYxSg5ePD7RFZoyawXGDpVP5tUdKVDmKMIHjgtzAvHywfKP4dSc8Io1U5MnH/df
 Fb0tzONq6IEWVpDddw7vEA0eblpwegZ3dsBMD4pQ34WYUdRVCKBCJ78zcPYnsJIyavfv
 W3v0c5ilbKrnUkREhk0Mtti/MT/ssj1Xe9GVdvD0tMQ7qARorlBnU6Sk2C1wQrwV3Y9A
 85hoYFO6YtBl5Q2Px+DiEQO+/JHtYZ8DtyhzWAgcRlTr/vHQiCrBu3RW2Gi7N4XN/dSL
 FNHg==
X-Gm-Message-State: APjAAAWZ3nnwpu+ZhWtnJ+RAp3GMM9IDuBOp2tKzbBCKwtkseCThx01k
 vFVMseuOkvjD0PikEnfC+y8=
X-Google-Smtp-Source: APXvYqy+6VH7xIi3h+OAf6vwpDbUxaBglIMQEy1oCU2ewIlqWc0wQ16ORmkb4hrYM61h8CR96w+g/Q==
X-Received: by 2002:a65:6546:: with SMTP id a6mr2600863pgw.220.1565854220757; 
 Thu, 15 Aug 2019 00:30:20 -0700 (PDT)
Received: from pasglop.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i124sm2137065pfe.61.2019.08.15.00.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 00:30:19 -0700 (PDT)
Message-ID: <21746c620de5ac0b9489a10cdc1f584f94d592fd.camel@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/xmon: Check for HV mode when dumping XIVE
 info from OPAL
From: Jordan Niethe <jniethe5@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Thu, 15 Aug 2019 17:30:15 +1000
In-Reply-To: <20190814154754.23682-2-clg@kaod.org>
References: <20190814154754.23682-1-clg@kaod.org>
 <20190814154754.23682-2-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.1 (3.30.1-1.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-14 at 17:47 +0200, Cédric Le Goater wrote:
> Currently, the xmon 'dx' command calls OPAL to dump the XIVE state in
> the OPAL logs and also outputs some of the fields of the internal
> XIVE
> structures in Linux. The OPAL calls can only be done on baremetal
> (PowerNV) and they crash a pseries machine. Fix by checking the
> hypervisor feature of the CPU.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/xmon/xmon.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 14e56c25879f..25d4adccf750 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -2534,13 +2534,16 @@ static void dump_pacas(void)
>  static void dump_one_xive(int cpu)
>  {
>  	unsigned int hwid = get_hard_smp_processor_id(cpu);
> -
> -	opal_xive_dump(XIVE_DUMP_TM_HYP, hwid);
> -	opal_xive_dump(XIVE_DUMP_TM_POOL, hwid);
> -	opal_xive_dump(XIVE_DUMP_TM_OS, hwid);
> -	opal_xive_dump(XIVE_DUMP_TM_USER, hwid);
> -	opal_xive_dump(XIVE_DUMP_VP, hwid);
> -	opal_xive_dump(XIVE_DUMP_EMU_STATE, hwid);
> +	bool hv = cpu_has_feature(CPU_FTR_HVMODE);
> +
> +	if (hv) {
> +		opal_xive_dump(XIVE_DUMP_TM_HYP, hwid);
> +		opal_xive_dump(XIVE_DUMP_TM_POOL, hwid);
> +		opal_xive_dump(XIVE_DUMP_TM_OS, hwid);
> +		opal_xive_dump(XIVE_DUMP_TM_USER, hwid);
> +		opal_xive_dump(XIVE_DUMP_VP, hwid);
> +		opal_xive_dump(XIVE_DUMP_EMU_STATE, hwid);
> +	}
>  
>  	if (setjmp(bus_error_jmp) != 0) {
>  		catch_memory_errors = 0;
dump_one_xive() / other xive functions are guarded by #ifdef
CONFIG_PPC_POWERNV in xmon.c aren't they? With this series would it be
that these guards can be removed?

