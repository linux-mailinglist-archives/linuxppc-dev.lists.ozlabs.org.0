Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CB7AD625
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:37:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lk+wQx8J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvK7x61cDz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:37:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lk+wQx8J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvK6z1b96z2yD7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 20:36:42 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PAJ8rZ024776;
	Mon, 25 Sep 2023 10:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=i9fLIrdnW/tP9BDXQ7Obn2gjfe78Zwe7kUpkXFU8vyM=;
 b=lk+wQx8JPXKVyfuj9PvEJNiOUorilEqZLs0IvFEgZcqppR1tmkMVGebgmlQAMuasZjDx
 89R+KF+CtKKTe03hhtJAhTk7a9h2IcDpWLV4wv11vsSskW3/xccVsaJX/mdQk1xNZEey
 mEKv6El0U0EOvyfkeO+zFX3K/EdHlNzuZY6j/o5efG5jYKwJK8n+XcbU1JoOfaYCeXK0
 MIX75T/sVqu8Z5O3w1hwVXoRPP8PxnermvVgSXmUQ97GjZX0VgnFCumEoEDVw73fzyqf
 eluHPSrfysOfOl4+hdDssqjo26mzoTO/aaFUHphdICJxhOqkkYBAN/780DEXmBHB/PgA 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta53qrh1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:36:33 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38PAaBIN011944;
	Mon, 25 Sep 2023 10:36:33 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta53qrgw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:36:32 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38P9HDRX010995;
	Mon, 25 Sep 2023 10:36:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabuk1839-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:36:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38PAaPUo14287550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 10:36:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A063C20043;
	Mon, 25 Sep 2023 10:36:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABF3220040;
	Mon, 25 Sep 2023 10:36:22 +0000 (GMT)
Received: from [9.43.77.183] (unknown [9.43.77.183])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Sep 2023 10:36:22 +0000 (GMT)
Message-ID: <992322d3-caca-2fe0-58c4-3a0edad811b3@linux.ibm.com>
Date: Mon, 25 Sep 2023 16:06:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V4 1/2] tools/perf: Add text_end to "struct dso" to save
 .text section size
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
References: <20230915053752.3012-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20230915053752.3012-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DdBP09XKsFfrlqb4PWufJCHXrR44Ot-l
X-Proofpoint-ORIG-GUID: LF5S1wQrcjADuJ7jCbGB8hLtlxcm31ea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_07,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250078
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
Cc: linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch looks good to me.

Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

On 9/15/23 11:07, Athira Rajeev wrote:
> Update "struct dso" to include new member "text_end".
> This new field will represent the offset for end of text
> section for a dso. For elf, this value is derived as:
> sh_size (Size of section in byes) + sh_offset (Section file
> offst) of the elf header for text.
> 
> For bfd, this value is derived as:
> 1. For PE file,
> section->size + ( section->vma - dso->text_offset)
> 2. Other cases:
> section->filepos (file position) + section->size (size of
> section)
> 
> To resolve the address from a sample, perf looks at the
> DSO maps. In case of address from a kernel module, there
> were some address found to be not resolved. This was
> observed while running perf test for "Object code reading".
> Though the ip falls beteen the start address of the loaded
> module (perf map->start ) and end address ( perf map->end),
> it was unresolved.
> 
> Example:
> 
>     Reading object code for memory address: 0xc008000007f0142c
>     File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     On file address is: 0x1114cc
>     Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     objdump read too few bytes: 128
>     test child finished with -1
> 
> Here, module is loaded at:
>     # cat /proc/modules | grep xfs
>     xfs 2228224 3 - Live 0xc008000007d00000
> 
> From objdump for xfs module, text section is:
>     text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
> 
> Here the offset for 0xc008000007f0142c ie  0x112074 falls out
> .text section which is up to 0x10f7bc.
> 
> In this case for module, the address 0xc008000007e11fd4 is pointing
> to stub instructions. This address range represents the module stubs
> which is allocated on module load and hence is not part of DSO offset.
> 
> To identify such  address, which falls out of text
> section and within module end, added the new field "text_end" to
> "struct dso".
> 
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> Changelog:
> v2 -> v3:
>  Added Reviewed-by from Adrian
> 
>  v1 -> v2:
>  Added text_end for bfd also by updating dso__load_bfd_symbols
>  as suggested by Adrian.
> 
>  tools/perf/util/dso.h        | 1 +
>  tools/perf/util/symbol-elf.c | 4 +++-
>  tools/perf/util/symbol.c     | 2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index b41c9782c754..70fe0fe69bef 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -181,6 +181,7 @@ struct dso {
>  	u8		 rel;
>  	struct build_id	 bid;
>  	u64		 text_offset;
> +	u64		 text_end;
>  	const char	 *short_name;
>  	const char	 *long_name;
>  	u16		 long_name_len;
> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> index 95e99c332d7e..9e7eeaf616b8 100644
> --- a/tools/perf/util/symbol-elf.c
> +++ b/tools/perf/util/symbol-elf.c
> @@ -1514,8 +1514,10 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
>  	}
>  
>  	if (elf_section_by_name(runtime_ss->elf, &runtime_ss->ehdr, &tshdr,
> -				".text", NULL))
> +				".text", NULL)) {
>  		dso->text_offset = tshdr.sh_addr - tshdr.sh_offset;
> +		dso->text_end = tshdr.sh_offset + tshdr.sh_size;
> +	}
>  
>  	if (runtime_ss->opdsec)
>  		opddata = elf_rawdata(runtime_ss->opdsec, NULL);
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 3f36675b7c8f..f25e4e62cf25 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -1733,8 +1733,10 @@ int dso__load_bfd_symbols(struct dso *dso, const char *debugfile)
>  			/* PE symbols can only have 4 bytes, so use .text high bits */
>  			dso->text_offset = section->vma - (u32)section->vma;
>  			dso->text_offset += (u32)bfd_asymbol_value(symbols[i]);
> +			dso->text_end = (section->vma - dso->text_offset) + section->size;
>  		} else {
>  			dso->text_offset = section->vma - section->filepos;
> +			dso->text_end = section->filepos + section->size;
>  		}
>  	}
>  
