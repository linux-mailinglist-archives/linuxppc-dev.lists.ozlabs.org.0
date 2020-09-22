Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33437273CC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 09:57:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwYYx5HtKzDqW0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 17:57:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwYWk5fKgzDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 17:55:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LyzubX0Z; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BwYWj4jm2z8vv8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 17:55:29 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BwYWh5qZ1z9sTW; Tue, 22 Sep 2020 17:55:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LyzubX0Z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BwYWg2ct0z9sPB;
 Tue, 22 Sep 2020 17:55:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08M7YHj5154377; Tue, 22 Sep 2020 03:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=P/sOaQTxIfxYAWbH6C6AEu3QhiaE9mXZKH/L2p+JUtE=;
 b=LyzubX0ZCPZFIiiz/AKC1w1HoJlav04Iqy2f9ekLucDOtJG4orkh71MPsmS7J6Dye4e6
 WvpNPfZ7QO36F5Ug/ROndvMAMAjjo8HT0LEVUR1AN0hqLujiHWqq9eSCL3UIssPpbJG5
 IX2pPcBiKfhkxkXRlObBJeWO6JaeKCCv/FyG8kHRs9zsLxIw6agTkyhuw2352RK33DOn
 kUI5suauwDCusAN6iM/SNDzoBLRVTkEGXW3irsQ9tgSjwuWNiIbGefr5mEKU5GTdGN6Q
 lBITO0Ix4ByWlpvQP5fi378wa8GlXiRaD/PTgFphF0n5j4GiCr3bJ3GSTFkHK+IaFz6I JQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33qag4mknq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 03:55:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08M7qCM0009474;
 Tue, 22 Sep 2020 07:55:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 33payu9jsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 07:55:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08M7t9NR19661114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 07:55:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C052A4059;
 Tue, 22 Sep 2020 07:55:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED618A4040;
 Tue, 22 Sep 2020 07:55:07 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 22 Sep 2020 07:55:07 +0000 (GMT)
Date: Tue, 22 Sep 2020 13:25:07 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Make VDSO32 track COMPAT on 64-bit
Message-ID: <20200922075507.3fgitavbbupmi53m@linux.vnet.ibm.com>
References: <20200908125850.407939-1-mpe@ellerman.id.au>
 <160034211494.3342081.16977957933269532766.b4-ty@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <160034211494.3342081.16977957933269532766.b4-ty@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_05:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 mlxscore=0 clxscore=1011 phishscore=0 adultscore=0
 mlxlogscore=921 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220061
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@ozlabs.org, msuchanek@suse.de, srikar@linux.vnet.ibm.com,
 Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <patch-notifications@ellerman.id.au> [2020-09-17 21:28:46]:

> On Tue, 8 Sep 2020 22:58:50 +1000, Michael Ellerman wrote:
> > When we added the VDSO32 kconfig symbol, which controls building of
> > the 32-bit VDSO, we made it depend on CPU_BIG_ENDIAN (for 64-bit).
> > 
> > That was because back then COMPAT was always enabled for 64-bit, so
> > depending on it would have left the 32-bit VDSO always enabled, which
> > we didn't want.
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/1] powerpc/64: Make VDSO32 track COMPAT on 64-bit
>       https://git.kernel.org/powerpc/c/231b232df8f67e7d37af01259c21f2a131c3911e
> 
> cheers

With this commit which is part of powerpc/next and with
/opt/at12.0/bin/gcc --version
gcc (GCC) 8.4.1 20191125 (Advance-Toolchain 12.0-3) [e25f27eea473]
throws up a compile error on a witherspoon/PowerNV with CONFIG_COMPAT.
CONFIG_COMPAT got carried from the distro config. (And looks like most
distros seem to be having this config)

cc1: error: _-m32_ not supported in this configuration
make[4]: *** [arch/powerpc/kernel/vdso32/sigtramp.o] Error 1
make[4]: *** Waiting for unfinished jobs....
cc1: error: _-m32_ not supported in this configuration
make[4]: *** [arch/powerpc/kernel/vdso32/gettimeofday.o] Error 1
make[3]: *** [arch/powerpc/kernel/vdso32] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [arch/powerpc/kernel] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [arch/powerpc] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [__sub-make] Error 2

I don't seem to be facing with other compilers like "gcc (Ubuntu
7.4.0-1ubuntu1~18.04.1) 7.4.0" and I was able to disable CONFIG_COMPAT and
proceed with the build.

-- 
Thanks and Regards
Srikar Dronamraju
