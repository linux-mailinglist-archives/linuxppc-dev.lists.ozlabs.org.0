Return-Path: <linuxppc-dev+bounces-4562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 516579FF646
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 06:38:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNwTn0MC7z2xk1;
	Thu,  2 Jan 2025 16:38:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735796284;
	cv=none; b=X8WhFd4CvkQDpx3seXG5ZagXIiyrYUcj1bqLVv/JZl8QqUmDWDBq/cuIKlHBh1pVeFCo9x5t/ycbCsMuX6W50I4G7s0JMH0P/zezQ08uk9IdO5TSSAoRuQvh29MpqUfBp9LVKaDHBfJupohbrqa4ECphJkr9G8YYJpwOJp8AGJVq+NpcBOsu8wQoWLnRVWTxB8uHThMha3+vRsimq4pAJySU0d6qu2axARzqW2mVex8DFGeZPov+eunleikg8mZBYPwrplyfjZ97IiGG3Do+Hc03CZhV92pk9sPfn5yyFCtaYaIHXyhOYChQf7jnxCxFtEbWZ4RF0VoGXHvLM0HZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735796284; c=relaxed/relaxed;
	bh=eg4Fl9mNLoRP2XFOH1wDCUzePu3zwBZJdjFFc1eUlj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADMEEiwXyWajJqrILnen2QWryiQVU5dCaX4+p5R3ZDg6tc/zw+tMRbuL6wl2KwfBVsagbJ8/ga019BXgxliVT0Kx/6/q9mMSMLjWYhdez3yOCbm4S/BbCRwKUr9TA+hAnjAg7F0cXB8lETkc1A46/NMsmgF2UBNFgmM92q08LT+fykLJPmsw4/CArjnwyA9X0IUfnQjHEcdG6lidHhLU31PpPRq+bc3ZMgG86NsLggA8hUrsfdHQsIq/Bji8kTZWlGssGL3h48aOZ2/c7z0AbGxR5VDv5RKae/XfX4C79E3cIJbW5dNahlZTYSMRgbFie7M7ekmhxid3ewfJ8Hgy1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aL4d7jKe; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aL4d7jKe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNwTl5YYXz2xGr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 16:38:03 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501KlLEM008711;
	Thu, 2 Jan 2025 05:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eg4Fl9
	mNLoRP2XFOH1wDCUzePu3zwBZJdjFFc1eUlj4=; b=aL4d7jKeRweKhrp42JV91v
	JX8/8K3WaRTyyJ0R2cXm1fzmaZrGigvDRgqYpsnOLnEaPu0XKMM2iZZSTTeGVBSa
	0VDMgqk8Dok6lgyOICbwTnDcoqleebv3AvrfuP1Iyca3uXn0omZkAI4xMLbULJCb
	P+qRm3UYxUP849aIwrxtFAyXMqrIWStZJ+e9c5XkGIW+tonw2SwXWOQLi9ZeDvI2
	T0E7jsPZtj5Gk18VQbeL2t59u9aKu5B9aG1bXKGLzjmY2GQ/odG/kdCPRn9XA0Xx
	B4DjKTmzQ3VnZzYPsK8JAm3UZXZBt3FNR6MtMq8oobfAeSU5r75C4dg3plwiCYaQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43w7649xhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 05:37:29 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5025YuNa015477;
	Thu, 2 Jan 2025 05:37:28 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43w7649xh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 05:37:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5024BUt7010120;
	Thu, 2 Jan 2025 05:37:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tvnngvyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 05:37:27 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5025bNn762456224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 05:37:24 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7D4620043;
	Thu,  2 Jan 2025 05:37:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F58920040;
	Thu,  2 Jan 2025 05:37:19 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.160])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  2 Jan 2025 05:37:19 +0000 (GMT)
Date: Thu, 2 Jan 2025 11:07:06 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel Gomez <da.gomez@samsung.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 1/3] sysfs: constify bin_attribute argument of
 sysfs_bin_attr_simple_read()
Message-ID: <xbgqegeqsobrkf32aepwwe3khhucebgjraorpstt5226pghadd@yx62fi2gdv2p>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <20241228-sysfs-const-bin_attr-simple-v2-1-7c6f3f1767a3@weissschuh.net>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241228-sysfs-const-bin_attr-simple-v2-1-7c6f3f1767a3@weissschuh.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K0tCbzaFqk7BHIgLmM55l7I93y31a2B1
X-Proofpoint-ORIG-GUID: d1GjE4-ccz4lJkp22uUoE_W9nitpvG_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020046
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Looks good to me. Did boot test and reading the /sys files works.

Linux-ci tests [0] are also good (the failing tests are broken from
some time, ignoring them):

[0]: https://github.com/adi-g15-ibm/linux-ci/actions?query=branch%3Atmp-test-branch-10962+branch%3Atmp-test-branch-26310+branch%3Atmp-test-branch-23431++

Tested-by: Aditya Gupta <adityagupta@ibm.com>

Thanks,
- Aditya G

On 24/12/28 09:43AM, Thomas Weißschuh wrote:
> Most users use this function through the BIN_ATTR_SIMPLE* macros,
> they can handle the switch transparently.
> Also adapt the two non-macro users in the same change.
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
> -- 
> 2.47.1
> 

