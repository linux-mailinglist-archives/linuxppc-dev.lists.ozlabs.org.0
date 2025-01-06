Return-Path: <linuxppc-dev+bounces-4699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC9A0242B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 12:20:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRWvJ5SmKz2ywy;
	Mon,  6 Jan 2025 22:20:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736162444;
	cv=none; b=AbRYMCkf0y38HHzW4NPtS4tyykanjU4K6/Qb1mPZvEJwERnpFh7W4Y76eYTMM8/TxTMrLHEtg5dYTwprpa7ItBB4pB3pveGw2cXNg2jPdzz66rdqujL35hdRmyHgb7KFRemL16X3YZeQtAj3QJowqF5RY/2SU68Pkl3jNusei5SfFxB3Ld2Vk/yASYiyP1JxhKb9osNDO0ly8GF6xq2wSOSlBay8K2cgTdJ+l0wSGv+ISNB+aMTmvdmVdeIdxGtE2W8LgUizZtFHIodPvPLtnYXcjb5R+AVtc6e9wxyNChuLyFTdsa0uamNbxx5CElGebdcRRyXFkvAfg0IEDIPhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736162444; c=relaxed/relaxed;
	bh=v5Yw099EHz6MEkPnNaIh+3BXdkeUW5CBuDtmFhcraAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iF8ysjk7QkNlvk2LUwKbAqh6oAa7Jspw+HiD4zUoHr05JScit9Gla6Iw5xjqsJFeQb+rThz01tlxUGlZaGw6xr1b/S5q2iFRNq128MHzFUIXlM2d40B+oHSrPJKbLU3ANJ4HC4DAW2zRxeZLe1F7uDBHP+dEB1qjk1rGHSLqrBGR+YrsgvBLPFevzCmzijp5jxNjP5P66WNCkvoc4ZvJhWQ3bboEmNjPSw6EX6GXYNdx/Tbneld5IM9oID6OSeK17CNUQRuXWxxOwDodWAKfd5CXRCpD5RDJBUmuiKoBXvRpzZU2O2ntYSNTOguhQlxrKL36DCSedBNBZvk+mGOvpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPNGojbR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPNGojbR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRWvH3Sxmz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 22:20:42 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 505Mt8wP020343;
	Mon, 6 Jan 2025 11:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=v5Yw09
	9EHz6MEkPnNaIh+3BXdkeUW5CBuDtmFhcraAo=; b=CPNGojbRI8G9Xe9YIDFYsa
	kafvcBQgYQhmlGEz/C+0IhxctRuKzQGsVilvy7Pbj7T8ASoybNuVKDNkxa0exErd
	5czzvX/f9LdFCecx51vbg4FNUM0tKnugB3oFMfC+ZFIiiLzL9j/NQJvxnFbkmOl8
	iZia8w7ssOR6Hlze45ZsfHDF2jWrSwWXJQ9H3rKU0xwOLnpa14C/II38sc0uYnta
	DJKcn5ZXEnMAnTjoJetH3VsQQcB60VSKShEtuFM4LroZUIYCYUyt/MQ+weGwCjHB
	0Ls7mjQl8DRk4tNWPDl/3E6eLem5uJgK3MTRLXMw8rk/SXQhTuv8X8rzvlvNGuzg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43yuj53b81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:20:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 506BK9Jc018759;
	Mon, 6 Jan 2025 11:20:10 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43yuj53b7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:20:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506AsjqT015851;
	Mon, 6 Jan 2025 11:20:09 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtknbjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:20:09 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506BK80C25166450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 11:20:08 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65C665805E;
	Mon,  6 Jan 2025 11:20:08 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF4EE5805A;
	Mon,  6 Jan 2025 11:19:59 +0000 (GMT)
Received: from [9.204.206.207] (unknown [9.204.206.207])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 11:19:59 +0000 (GMT)
Message-ID: <1fe2354e-3547-4000-80b7-1ed2b8e9fb4a@linux.ibm.com>
Date: Mon, 6 Jan 2025 16:49:56 +0530
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
Subject: Re: [PATCH v2 1/3] sysfs: constify bin_attribute argument of
 sysfs_bin_attr_simple_read()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Luis Chamberlain
 <mcgrof@kernel.org>,
        Petr Pavlu <petr.pavlu@suse.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel Gomez
 <da.gomez@samsung.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, bpf@vger.kernel.org
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <20241228-sysfs-const-bin_attr-simple-v2-1-7c6f3f1767a3@weissschuh.net>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20241228-sysfs-const-bin_attr-simple-v2-1-7c6f3f1767a3@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AHfJrK3rb9Diywl8AVVuZD27PQCq2XP8
X-Proofpoint-ORIG-GUID: As2AB4yLDgPlApUpgdQrhIW0gWCBUZqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060097
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/28/24 2:13 PM, Thomas Weißschuh wrote:
> Most users use this function through the BIN_ATTR_SIMPLE* macros,
> they can handle the switch transparently.
> Also adapt the two non-macro users in the same change.

Changes looks fine to me.

Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  arch/powerpc/platforms/powernv/opal.c | 2 +-
>  fs/sysfs/file.c                       | 2 +-
>  include/linux/sysfs.h                 | 4 ++--
>  kernel/module/sysfs.c                 | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index 5d0f35bb917ebced8c741cd3af2c511949a1d2ef..013637e2b2a8e6a4ec6b93a520f8d5d9d3245467 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -818,7 +818,7 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
>  	sysfs_bin_attr_init(attr);
>  	attr->attr.name = name;
>  	attr->attr.mode = 0400;
> -	attr->read = sysfs_bin_attr_simple_read;
> +	attr->read_new = sysfs_bin_attr_simple_read;
>  	attr->private = __va(vals[0]);
>  	attr->size = vals[1];
>  
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 785408861c01c89fc84c787848243a13c1338367..6931308876c4ac3b4c19878d5e1158ad8fe4f16f 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -817,7 +817,7 @@ EXPORT_SYMBOL_GPL(sysfs_emit_at);
>   * Returns number of bytes written to @buf.
>   */
>  ssize_t sysfs_bin_attr_simple_read(struct file *file, struct kobject *kobj,
> -				   struct bin_attribute *attr, char *buf,
> +				   const struct bin_attribute *attr, char *buf,
>  				   loff_t off, size_t count)
>  {
>  	memcpy(buf, attr->private + off, count);
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index 0f2fcd244523f050c5286f19d4fe1846506f9214..2205561159afdb57d0a250bb0439b28c01d9010e 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -511,7 +511,7 @@ __printf(3, 4)
>  int sysfs_emit_at(char *buf, int at, const char *fmt, ...);
>  
>  ssize_t sysfs_bin_attr_simple_read(struct file *file, struct kobject *kobj,
> -				   struct bin_attribute *attr, char *buf,
> +				   const struct bin_attribute *attr, char *buf,
>  				   loff_t off, size_t count);
>  
>  #else /* CONFIG_SYSFS */
> @@ -774,7 +774,7 @@ static inline int sysfs_emit_at(char *buf, int at, const char *fmt, ...)
>  
>  static inline ssize_t sysfs_bin_attr_simple_read(struct file *file,
>  						 struct kobject *kobj,
> -						 struct bin_attribute *attr,
> +						 const struct bin_attribute *attr,
>  						 char *buf, loff_t off,
>  						 size_t count)
>  {
> diff --git a/kernel/module/sysfs.c b/kernel/module/sysfs.c
> index 456358e1fdc43e6b5b24f383bbefa37812971174..254017b58b645d4afcf6876d29bcc2e2113a8dc4 100644
> --- a/kernel/module/sysfs.c
> +++ b/kernel/module/sysfs.c
> @@ -196,7 +196,7 @@ static int add_notes_attrs(struct module *mod, const struct load_info *info)
>  			nattr->attr.mode = 0444;
>  			nattr->size = info->sechdrs[i].sh_size;
>  			nattr->private = (void *)info->sechdrs[i].sh_addr;
> -			nattr->read = sysfs_bin_attr_simple_read;
> +			nattr->read_new = sysfs_bin_attr_simple_read;
>  			++nattr;
>  		}
>  		++loaded;
> 


