Return-Path: <linuxppc-dev+bounces-6595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4CA4AF46
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 05:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z58Qn1dPYz30gC;
	Sun,  2 Mar 2025 15:41:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740890465;
	cv=none; b=ODIQwzTtMvVsa6sA+CBcg/GGtpfXCD8DYfG1v3PSbVcDSrpI3LM+WuyaFUETf1yFi5iMnkmvJv9mLgIWumj47K+ddfrnLrvd6qeqIDVV0gD4ShW0giuBFNSVIZiKuJmma6O+o0pdGDJv/V3kMJde91NO2+ko0PoqMWAnzYAR8oA+SB55eop7y7SsPbFB4VsPo7T5EqhklfCNHnY9FdcPEs8x3BfE9xzR1gAMTba9Vkva5vwWU6gAFkAIMGXx1romq82q+5GD+LeWPVg9fDrgqRG1BF9eqATtWUgeR20UfF8VAeBo0z7oYQJCATddtYIm6iSzF0CRtITDPqvO7m47gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740890465; c=relaxed/relaxed;
	bh=drlV7a/aAtnnmBv/4UJICLmu+UUeydqMi2vKWotxyyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CE7x/D8jyiKl8oPMfU30tv+m4ILYo4qPH5lua7qO+7fM0ydSf5UcXrlnJUnczLjGRgv/EM1fpQZgrJRYGd4iCSwLmP8gFWqwwOqAjQ95MWdsvYcnjn8QL0wFDCJMEkS2xp4JyvX2AIGYlX3ML9au5CSAMCNQ7NtNquoIkWduY/xUCsjbH2aFn+VhKZtZc3EuntThuJlFUUUCHzf66yL3u5eQ41AAOfVCzHn25xlpMjp2c1sRghkuKU83nYU9o3ncbrQishXmezMAUquQs+3l0OIjhRgDCmeoP290AhF3lCO+Et+6gUyc+ewZTnhnukfp+OKH/gjtHkSjJSZBBPiMcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVT/TZRy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVT/TZRy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z58Qm34tnz30CL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 15:41:04 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5220p6Zj006536;
	Sun, 2 Mar 2025 04:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=drlV7a
	/aAtnnmBv/4UJICLmu+UUeydqMi2vKWotxyyY=; b=TVT/TZRy/4wW8q87BCEq90
	S77LhuZsnmzOvpoZcO5u8NWpgJN7ItwlRqDHNi3DQmyb+RuUNm51kihkKJVqEXvw
	ET/zvyHqO5xkWvNLCFcF4mOJMz5JhTQy5ChCmhEh6IsIDxh7QSWjqWouhrJbDvCq
	8KcB/JgBYKUOKLfOaG017kGGOx9FscEAemImIfr5ktWcttBoy/8TdpRfybmHQymV
	H3/QADS1SbJUkcfBvs7XegfFBbzLP24EFOycvKbVXrzVyPldiFSsg5wTEUMqnjp3
	6xJLzyLuwbQHxvrjeC2fKHLuDPkxUdkMjAr985GIQnB0WHqAjqag8n2tVbqAGmuQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4542912s5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 04:40:51 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5221JMYD020853;
	Sun, 2 Mar 2025 04:40:50 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454djn0pks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 04:40:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5224eml233620552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 04:40:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 984E320049;
	Sun,  2 Mar 2025 04:40:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86DAE20040;
	Sun,  2 Mar 2025 04:40:45 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.83.152])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Mar 2025 04:40:45 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: arnd@arndb.de, jk@ozlabs.org, segher@kernel.crashing.org
Subject: Re: [PATCH v2 01/25] powerpc/cell: Remove support for IBM Cell Blades
Date: Sun,  2 Mar 2025 10:10:43 +0530
Message-ID: <174089027712.25244.5691548361548988502.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: louTjj_ryRUCxCjjypQAryBhHqSFE1_E
X-Proofpoint-ORIG-GUID: louTjj_ryRUCxCjjypQAryBhHqSFE1_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_10,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011 spamscore=0
 phishscore=0 mlxlogscore=896 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503020031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 18 Dec 2024 21:54:49 +1100, Michael Ellerman wrote:
> IBM Cell Blades used the Cell processor and the "blade" server form
> factor. They were sold as models QS20, QS21 & QS22 from roughly 2006 to
> 2012 [1]. They were used in a few supercomputers (eg. Roadrunner) that
> have since been dismantled, and were not that widely used otherwise.
> 
> Until recently I still had a working QS22, which meant I was able to
> keep the platform support working, but unfortunately that machine has
> now died.
> 
> [...]

Applied to powerpc/next.

[01/25] powerpc/cell: Remove support for IBM Cell Blades
        https://git.kernel.org/powerpc/c/05bf59fbeef3438c916a6bd3f16fc2839e9f2160
[02/25] powerpc: Remove some Cell leftovers
        https://git.kernel.org/powerpc/c/8e4f1a3495c2f22ad01bb4c925950d680bbbe5aa
[03/25] powerpc: Remove PPC_PMI and driver
        https://git.kernel.org/powerpc/c/38efe5a9a7a78fceef1d189900210855a155ebc6
[04/25] powerpc: Remove IBM_CELL_BLADE & SPIDER_NET references
        https://git.kernel.org/powerpc/c/de9d1be44e5060bf0ce43ad2069908c802d7aa5e
[05/25] powerpc/cell: Remove CBE_CPUFREQ_SPU_GOVERNOR
        https://git.kernel.org/powerpc/c/11923e0d9d958b8349e6099ebd3cad7733ffa35f
[06/25] powerpc/xmon: Remove SPU debug and disassembly
        https://git.kernel.org/powerpc/c/41cc49efffd73d44be7c6c104a50754c11b957bd
[07/25] powerpc: Remove DCR_MMIO and the DCR generic layer
        https://git.kernel.org/powerpc/c/bd4a83428bbd297745a5708ab66377709c4adb46
[08/25] powerpc: Remove PPC_OF_PLATFORM_PCI
        https://git.kernel.org/powerpc/c/f026dffd548f8a516e9d00623a454ee5d9349ed6
[09/25] powerpc/io: Remove PPC_IO_WORKAROUNDS
        https://git.kernel.org/powerpc/c/478e1709ad8a2a418f724a1dfa815bfa9eafcfc9
[10/25] powerpc/io: Remove PPC_INDIRECT_MMIO
        https://git.kernel.org/powerpc/c/6584845b3d8b860d846e80c4cf5453a6058d67f9
[11/25] powerpc/io: Remove PCI_FIX_ADDR
        https://git.kernel.org/powerpc/c/de9cc05822bf39a8ad0236857298d856fd497616
[12/25] powerpc/io: Unhook MMIO accessors
        https://git.kernel.org/powerpc/c/15efd61fa74d23d055075f90101b0e1345799cec
[13/25] powerpc/io: Remove unnecessary indirection
        https://git.kernel.org/powerpc/c/41c8992c02a58cd5294546d98391dd542bea2d68
[14/25] powerpc/io: Wrap port calculation in a macro
        https://git.kernel.org/powerpc/c/8a55941aed70196c1868280b76385709aff9b844
[15/25] powerpc/io: Spell-out PCI_IO_ADDR
        https://git.kernel.org/powerpc/c/c051451b7ad1db27ac9f8672822c29db2ceb97b4
[16/25] powerpc/io: Use generic raw accessors
        https://git.kernel.org/powerpc/c/0305292f17bc1f4fc66a24a8dd1a5e047673c02d
[17/25] powerpc/io: Rename _insw_ns() etc.
        https://git.kernel.org/powerpc/c/76c7d4300d99fbf7f81190c2cec794ff85e1770d
[18/25] powerpc/io: Use standard barrier macros in io.c
        https://git.kernel.org/powerpc/c/1b52e091e7f1422a5b285c68606c307cfdf2b674
[19/25] powerpc: Remove UDBG_RTAS_CONSOLE
        https://git.kernel.org/powerpc/c/b78e0bff85919729a1bff96b4f2517e79eb6063b
[20/25] docs: Remove reference to removed CBE_CPUFREQ_SPU_GOVERNOR
        https://git.kernel.org/powerpc/c/215bd64ada73a476a7bcb7d8fd27b02adc319f5b
[21/25] genirq: Remove IRQ_EDGE_EOI_HANDLER
        https://git.kernel.org/powerpc/c/333e8eb3e0817b41582d93982babe39e8599835c
[22/25] cpufreq: ppc_cbe: Remove powerpc Cell driver
        https://git.kernel.org/powerpc/c/16479389cfeb8031e81e3d4fecf98aaa2724386d
[24/25] net: spider_net: Remove powerpc Cell driver
        https://git.kernel.org/powerpc/c/d9fefcea813e565ccfd0259db570a00aa719046c
[25/25] net: toshiba: Remove reference to PPC_IBM_CELL_BLADE
        https://git.kernel.org/powerpc/c/5722915493acaaae05850d48efc742fc6f5373d8

Thanks

