Return-Path: <linuxppc-dev+bounces-6739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8178A4FE1A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 12:57:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z79z21JPYz2xdg;
	Wed,  5 Mar 2025 22:57:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741175854;
	cv=none; b=oiNXuCLqihvIwYxVrHfZDmJuqZqcAUwNsCRXNBDZrWtSE0CkTA7ae2mGQOJV5dhaaFhEyBCP8ttjxJWm2JWUCUMVjhecIPev5vDI60M2kMsRmz88AIhe1RtQ1GK+04RmyhESNE0VOM1Q3mrIKkwcDpGknP5Oa9PFgWEqcrguChmpqgFzFLCt43G54mFJF3PzOud/qZKfHUxMnxT+uOxLkluqv02f0ICMAlbH7GaZTwgFvrbSgGaXB98XEawoBsZ/UOUTigznUskbYFW86ulsSHxyh3NMR662605MGFVKOsPvAcHM/VevSJQPy3V63FFLvTozsM5237N2U7Wo7TVNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741175854; c=relaxed/relaxed;
	bh=uVs5dFBJlU9Gp58NWUldNjyOJ9ulyImUdVlfjx1/B4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRKaGgUbIslDhXmF47Is9X0Wxr8Hod88Oa+qfJzkmDwY4M4TJOuU9MSoMW8Zpbxvo8H4lVubiCy9SF/adYCN77eFej5GOR1YMQAF6ASJIuSPCpMO+knJOuftqCJb8Mg7/72T5leqdmAaLFZJY9PKLEq5y9ikiKUinBUS9UBXEnq/TX7Ab4MOYh+xcm9jr8xGoBTs/oIJVHdS6PXCYBgYdItKppSZ7c71SVfa2V1r0dUPY5PaoYButdNEMdrDggIEoBO8zD36qPmfeIjwJiUJjRVoIfJc/OgzlBLOUHquEUMwwbS9a+DLFuvhl/oEnFiR7RXPfdBJSROgyz3dgydGbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hm/bKNr0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hm/bKNr0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z79z124dZz2xdN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 22:57:33 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52580XNv013701;
	Wed, 5 Mar 2025 11:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uVs5dF
	BJlU9Gp58NWUldNjyOJ9ulyImUdVlfjx1/B4E=; b=Hm/bKNr0cj35OUT7Oy4ifi
	8YIoJvdxwC9w22pcwk7XpI496q+oC8SFWFAB3GyoFbWpLVIwtJjQGV62gz0z888U
	/+Qi0AgBRxBjuuEGJpqApqmn2GeIte1ijlDSZzAvN/+HD/c/MuVjQsFeoUsOlHFN
	kaQ7vGLEK56XaY9v4LFt0kFxQOXr9TEM5Iv9SJPTj3LUpgBZdbTjbNRk6Vwv7NdA
	9m7tP0fa7yv6u3ZIfrFCRE7/DxPLupQeopB/+Exv0nvepfPq/rET7t3Z6Sm9PYrM
	Tj/D3Kl/mSsVj+JyQRmOI1trx//omAGsrjOY5Y293mnYAiKhA/ClXn+iZysT2LkA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568r0kap9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:57:25 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 525Bk3gN023077;
	Wed, 5 Mar 2025 11:57:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568r0kap8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:57:25 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 525ANglO008901;
	Wed, 5 Mar 2025 11:57:24 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454cxyjraf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 11:57:24 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 525BvLGO32244456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 11:57:21 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5914F58052;
	Wed,  5 Mar 2025 11:57:21 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF70558050;
	Wed,  5 Mar 2025 11:57:16 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Mar 2025 11:57:16 +0000 (GMT)
Message-ID: <737d47f8-50cb-4753-86ce-a811bbcec6a5@linux.ibm.com>
Date: Wed, 5 Mar 2025 17:27:15 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/perf: Add field to annotation options to
 determine disassembler used
Content-Language: en-GB
To: Athira Rajeev <atrajeev@linux.ibm.com>, acme@kernel.org, jolsa@kernel.org,
        adrian.hunter@intel.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        Tejas.Manhas1@ibm.com
References: <20250304154114.62093-1-atrajeev@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250304154114.62093-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O3m8IoMnGbtPgMGRFkpzIZmzYbdIHeqx
X-Proofpoint-ORIG-GUID: kpPSvqj413ynUN24tRqFqpoO5cPysJgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503050097
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Applied this patch on next-20250227, and issue is fixed.

./perf -v

perf version 6.14.rc4.g2a432e11ebbb

./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err
./perf annotate --stdio 1> out 2>err


Please add below tag.

Tested-By: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,

Venkat.

On 04/03/25 9:11 pm, Athira Rajeev wrote:
> When doing "perf annotate", perf tool provides option to
> use specific disassembler like llvm/objdump/capstone. The
> order picked is to use llvm first and if that fails fallback
> to objdump ie to use PERF_DISASM_LLVM, PERF_DISASM_CAPSTONE
> and PERF_DISASM_OBJDUMP
>
> In powerpc, when using "data type" sort keys, first preferred
> approach is to read the raw instruction from the DSO. In objdump
> is specified in "--objdump" option, it picks the symbol disassemble
> using objdump. Currently disasm_line__parse_powerpc() function
> uses length of the "line" to determine if objdump is used.
> But there are few cases, where if objdump doesn't recognise the
> instruction, the disassembled string will be empty.
>
> Example:
>
>       134cdc:	c4 05 82 41 	beq     1352a0 <getcwd+0x6e0>
>       134ce0:	ac 00 8e 40 	bne     cr3,134d8c <getcwd+0x1cc>
>       134ce4:	0f 00 10 04 	pld     r9,1028308
> ====>134ce8:	d4 b0 20 e5
>       134cec:	16 00 40 39 	li      r10,22
>       134cf0:	48 01 21 ea 	ld      r17,328(r1)
>
> So depending on length of line will give bad results.
>
> Add a new filed to annotation options structure,
> "struct annotation_options" to save the disassembler used.
> Use this info to determine if disassembly is done while
> parsing the disasm line.
>
> Reported-by: Tejas Manhas <Tejas.Manhas1@ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>   tools/perf/util/annotate.h |  1 +
>   tools/perf/util/disasm.c   | 22 +++++++++++++---------
>   2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
> index 98db1b88daf4..30a344afd91a 100644
> --- a/tools/perf/util/annotate.h
> +++ b/tools/perf/util/annotate.h
> @@ -58,6 +58,7 @@ struct annotation_options {
>   	     full_addr;
>   	u8   offset_level;
>   	u8   disassemblers[MAX_DISASSEMBLERS];
> +	u8   disassembler_used;
>   	int  min_pcnt;
>   	int  max_lines;
>   	int  context;
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 50c5c206b70e..a53e8c4e5bca 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -48,7 +48,7 @@ static int call__scnprintf(struct ins *ins, char *bf, size_t size,
>   
>   static void ins__sort(struct arch *arch);
>   static int disasm_line__parse(char *line, const char **namep, char **rawp);
> -static int disasm_line__parse_powerpc(struct disasm_line *dl);
> +static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_args *args);
>   static char *expand_tabs(char *line, char **storage, size_t *storage_len);
>   
>   static __attribute__((constructor)) void symbol__init_regexpr(void)
> @@ -968,24 +968,24 @@ static int disasm_line__parse(char *line, const char **namep, char **rawp)
>   #define	PPC_OP(op)	(((op) >> 26) & 0x3F)
>   #define	RAW_BYTES	11
>   
> -static int disasm_line__parse_powerpc(struct disasm_line *dl)
> +static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_args *args)
>   {
>   	char *line = dl->al.line;
>   	const char **namep = &dl->ins.name;
>   	char **rawp = &dl->ops.raw;
>   	char *tmp_raw_insn, *name_raw_insn = skip_spaces(line);
>   	char *name = skip_spaces(name_raw_insn + RAW_BYTES);
> -	int objdump = 0;
> +	int disasm = 0;
>   
> -	if (strlen(line) > RAW_BYTES)
> -		objdump = 1;
> +	if (args->options->disassembler_used)
> +		disasm = 1;
>   
>   	if (name_raw_insn[0] == '\0')
>   		return -1;
>   
> -	if (objdump) {
> +	if (disasm)
>   		disasm_line__parse(name, namep, rawp);
> -	} else
> +	else
>   		*namep = "";
>   
>   	tmp_raw_insn = strndup(name_raw_insn, 11);
> @@ -995,7 +995,7 @@ static int disasm_line__parse_powerpc(struct disasm_line *dl)
>   	remove_spaces(tmp_raw_insn);
>   
>   	sscanf(tmp_raw_insn, "%x", &dl->raw.raw_insn);
> -	if (objdump)
> +	if (disasm)
>   		dl->raw.raw_insn = be32_to_cpu(dl->raw.raw_insn);
>   
>   	return 0;
> @@ -1054,7 +1054,7 @@ struct disasm_line *disasm_line__new(struct annotate_args *args)
>   
>   	if (args->offset != -1) {
>   		if (arch__is(args->arch, "powerpc")) {
> -			if (disasm_line__parse_powerpc(dl) < 0)
> +			if (disasm_line__parse_powerpc(dl, args) < 0)
>   				goto out_free_line;
>   		} else if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
>   			goto out_free_line;
> @@ -2289,16 +2289,20 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
>   
>   		switch (dis) {
>   		case PERF_DISASM_LLVM:
> +			args->options->disassembler_used = PERF_DISASM_LLVM;
>   			err = symbol__disassemble_llvm(symfs_filename, sym, args);
>   			break;
>   		case PERF_DISASM_CAPSTONE:
> +			args->options->disassembler_used = PERF_DISASM_CAPSTONE;
>   			err = symbol__disassemble_capstone(symfs_filename, sym, args);
>   			break;
>   		case PERF_DISASM_OBJDUMP:
> +			args->options->disassembler_used = PERF_DISASM_OBJDUMP;
>   			err = symbol__disassemble_objdump(symfs_filename, sym, args);
>   			break;
>   		case PERF_DISASM_UNKNOWN: /* End of disassemblers. */
>   		default:
> +			args->options->disassembler_used = PERF_DISASM_UNKNOWN;
>   			goto out_remove_tmp;
>   		}
>   		if (err == 0)

