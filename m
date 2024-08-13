Return-Path: <linuxppc-dev+bounces-640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF696200F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 08:53:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtw930ks6z2ydQ;
	Wed, 28 Aug 2024 16:53:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724827991;
	cv=none; b=Nj7xuFLRnsXe5tbv45cEo697eopTeL+ehMnK24a9+vSZcG0186vUGsMZUKHa5nzv2ZlgezuUIVrwOExxadkUH4f/PPOd74h0BMn24h3VO7J6pBJbxZkDkW6mPevOWwsDrKnizUvckw0vtgkZWzjVO/HtjRf+Xvmp3yasyICM6W5f9sjng+ZUHoTAhOu7mHhnBsS47oWjvnHs1ByWgvsSICrinIX3ama1AOELdYl6ZkWXpVngrFAMLyfXRjb51vje3hqoOhpSqbWvBZfYDIW6Fpbhz4byAbm3j4fbclPkxzwvWFWEEW/196Z1m4HmjGtFFpjrvIlLRYLEgh9lrXDz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724827991; c=relaxed/relaxed;
	bh=bsnxeBU3GWy7xz8iBn1Z+4dktQMsXj48dVCjl5yuv+k=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:Date:User-Agent:X-TM-AS-GCONF:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=ogoOp50+xa13G5U4iDgROkGpV8dcS2OgCLU0nZiM2qUIiu8aWSNO8jHeitV58orZ+qIZ3Ey4ZBRjGHJtPVckP3uvbuR5V7I1MpMmM1QNU0IDIiBMMThxdKMmUw8vbblNQtckk6IhmH1SDfU1KRFx3OY8Xz6UCjT/wWQ4e7CkCrb8xt3Ex/f45iL50Oh9MS2xXlQaalkA5AzVMVEbu6jQ0WTYZ2l//3U2yXqvwlUme8LJ7ikPezqAq+uOwpajkZY6cLsdLH6x9O5TB7iPfOCjFPbtqdFnkmF8lBowL1vmxlF8Jx9H5MEwZmxC2wiOT97JKzvKe5XF5j6M+Kuplzafxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lbIEdOXE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lbIEdOXE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtw921k5yz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 16:53:10 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RM3KJm003270;
	Wed, 28 Aug 2024 06:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version:date; s=
	pp1; bh=bsnxeBU3GWy7xz8iBn1Z+4dktQMsXj48dVCjl5yuv+k=; b=lbIEdOXE
	e0c/pwaafZfd6pAs6Fy6xEdKiDnFkWMLTgrwV7ZYyLskEcoFcXpIIyCak02gJ6hR
	yVxADNpy2Dtw6Z/SOi2r/EniZjWcAB0KBg88I1vgrSHyb7b4jxhwUTbwEkYuJRfG
	4AlKwWnRev6rxiUQ4d+rpGbTIWuqttBuuQQcytof37VihmYEvtq8obaWx4rv8EPy
	xuTns3QG6wPjhyZKJqQMwAiDGyJZUcx0kVXa6H9Pw2ih7OOjvZ4ruKOO2m4vqryB
	/srTcHJFvl766gYa7fs3Mbdfb5/ulCYytHClU6vzX5zLeWcKBCt5OXafu+6asbc9
	3T7FpWudgr4Ang==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8p1fn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 06:53:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47S2bDav024611;
	Wed, 28 Aug 2024 06:53:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 417vj3e19m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 06:53:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47S6qx6M18612644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 06:52:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F30BC20043;
	Wed, 28 Aug 2024 06:52:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F10020040;
	Wed, 28 Aug 2024 06:52:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Aug 2024 06:52:58 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 87EC9602F4;
	Wed, 28 Aug 2024 16:52:54 +1000 (AEST)
Message-ID: <2b345a08daceebb324e730e5f187acba3d388aff.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] cxl: Drop printing of DT properties
From: Andrew Donnellan <ajd@linux.ibm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Frederic Barrat
	 <fbarrat@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240729-dt-cxl-cleanup-v1-1-a75eea80d231@kernel.org>
References: <20240729-dt-cxl-cleanup-v1-0-a75eea80d231@kernel.org>
	 <20240729-dt-cxl-cleanup-v1-1-a75eea80d231@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Tue, 13 Aug 2024 20:14:15 +1000
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7sXhPrKmvq_nPAa-3TcMwnMw6nC2MTYN
X-Proofpoint-ORIG-GUID: 7sXhPrKmvq_nPAa-3TcMwnMw6nC2MTYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408280041

On Mon, 2024-07-29 at 16:36 -0600, Rob Herring (Arm) wrote:
> There's little reason to dump DT property values when they can be
> read
> at any time from the DT in /proc/device-tree. If such a feature is
> needed, then it really should be implemented in the DT core such that
> any module/driver can use it.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

I'm okay with this, I think this level of dmesg verbosity was more
useful in the early days of implementing guest support than it is now,
and I'm hoping to rip the cxl driver out completely at some point
anyway.

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0drivers/misc/cxl/of.c | 101 ++-------------------------------------=
-
> ----------
> =C2=A01 file changed, 3 insertions(+), 98 deletions(-)
>=20
> diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
> index bcc005dff1c0..21ecce0f9403 100644
> --- a/drivers/misc/cxl/of.c
> +++ b/drivers/misc/cxl/of.c
> @@ -19,8 +19,6 @@ static const __be32 *read_prop_string(const struct
> device_node *np,
> =C2=A0	const __be32 *prop;
> =C2=A0
> =C2=A0	prop =3D of_get_property(np, prop_name, NULL);
> -	if (cxl_verbose && prop)
> -		pr_info("%s: %s\n", prop_name, (char *) prop);
> =C2=A0	return prop;
> =C2=A0}
> =C2=A0
> @@ -32,8 +30,6 @@ static const __be32 *read_prop_dword(const struct
> device_node *np,
> =C2=A0	prop =3D of_get_property(np, prop_name, NULL);
> =C2=A0	if (prop)
> =C2=A0		*val =3D be32_to_cpu(prop[0]);
> -	if (cxl_verbose && prop)
> -		pr_info("%s: %#x (%u)\n", prop_name, *val, *val);
> =C2=A0	return prop;
> =C2=A0}
> =C2=A0
> @@ -45,8 +41,6 @@ static const __be64 *read_prop64_dword(const struct
> device_node *np,
> =C2=A0	prop =3D of_get_property(np, prop_name, NULL);
> =C2=A0	if (prop)
> =C2=A0		*val =3D be64_to_cpu(prop[0]);
> -	if (cxl_verbose && prop)
> -		pr_info("%s: %#llx (%llu)\n", prop_name, *val,
> *val);
> =C2=A0	return prop;
> =C2=A0}
> =C2=A0
> @@ -100,9 +94,6 @@ static int read_phys_addr(struct device_node *np,
> char *prop_name,
> =C2=A0					type, prop_name);
> =C2=A0				return -EINVAL;
> =C2=A0			}
> -			if (cxl_verbose)
> -				pr_info("%s: %#x %#llx (size
> %#llx)\n",
> -					prop_name, type, addr,
> size);
> =C2=A0		}
> =C2=A0	}
> =C2=A0	return 0;
> @@ -139,27 +130,13 @@ int cxl_of_read_afu_handle(struct cxl_afu *afu,
> struct device_node *afu_np)
> =C2=A0
> =C2=A0int cxl_of_read_afu_properties(struct cxl_afu *afu, struct
> device_node *np)
> =C2=A0{
> -	int i, len, rc;
> -	char *p;
> +	int i, rc;
> =C2=A0	const __be32 *prop;
> =C2=A0	u16 device_id, vendor_id;
> =C2=A0	u32 val =3D 0, class_code;
> =C2=A0
> =C2=A0	/* Properties are read in the same order as listed in PAPR
> */
> =C2=A0
> -	if (cxl_verbose) {
> -		pr_info("Dump of the 'ibm,coherent-platform-
> function' node properties:\n");
> -
> -		prop =3D of_get_property(np, "compatible", &len);
> -		i =3D 0;
> -		while (i < len) {
> -			p =3D (char *) prop + i;
> -			pr_info("compatible: %s\n", p);
> -			i +=3D strlen(p) + 1;
> -		}
> -		read_prop_string(np, "name");
> -	}
> -
> =C2=A0	rc =3D read_phys_addr(np, "reg", afu);
> =C2=A0	if (rc)
> =C2=A0		return rc;
> @@ -173,19 +150,10 @@ int cxl_of_read_afu_properties(struct cxl_afu
> *afu, struct device_node *np)
> =C2=A0	else
> =C2=A0		afu->psa =3D true;
> =C2=A0
> -	if (cxl_verbose) {
> -		read_prop_string(np, "ibm,loc-code");
> -		read_prop_string(np, "device_type");
> -	}
> -
> =C2=A0	read_prop_dword(np, "ibm,#processes", &afu-
> >max_procs_virtualised);
> =C2=A0
> -	if (cxl_verbose) {
> -		read_prop_dword(np, "ibm,scratchpad-size", &val);
> -		read_prop_dword(np, "ibm,programmable", &val);
> -		read_prop_string(np, "ibm,phandle");
> +	if (cxl_verbose)
> =C2=A0		read_vpd(NULL, afu);
> -	}
> =C2=A0
> =C2=A0	read_prop_dword(np, "ibm,max-ints-per-process", &afu->guest-
> >max_ints);
> =C2=A0	afu->irqs_max =3D afu->guest->max_ints;
> @@ -199,17 +167,9 @@ int cxl_of_read_afu_properties(struct cxl_afu
> *afu, struct device_node *np)
> =C2=A0		afu->pp_irqs--;
> =C2=A0	}
> =C2=A0
> -	if (cxl_verbose) {
> -		read_prop_dword(np, "ibm,max-ints", &val);
> -		read_prop_dword(np, "ibm,vpd-size", &val);
> -	}
> -
> =C2=A0	read_prop64_dword(np, "ibm,error-buffer-size", &afu-
> >eb_len);
> =C2=A0	afu->eb_offset =3D 0;
> =C2=A0
> -	if (cxl_verbose)
> -		read_prop_dword(np, "ibm,config-record-type", &val);
> -
> =C2=A0	read_prop64_dword(np, "ibm,config-record-size", &afu-
> >crs_len);
> =C2=A0	afu->crs_offset =3D 0;
> =C2=A0
> @@ -235,15 +195,6 @@ int cxl_of_read_afu_properties(struct cxl_afu
> *afu, struct device_node *np)
> =C2=A0					i, class_code);
> =C2=A0			}
> =C2=A0		}
> -
> -		read_prop_dword(np, "ibm,function-number", &val);
> -		read_prop_dword(np, "ibm,privileged-function",
> &val);
> -		read_prop_dword(np, "vendor-id", &val);
> -		read_prop_dword(np, "device-id", &val);
> -		read_prop_dword(np, "revision-id", &val);
> -		read_prop_dword(np, "class-code", &val);
> -		read_prop_dword(np, "subsystem-vendor-id", &val);
> -		read_prop_dword(np, "subsystem-id", &val);
> =C2=A0	}
> =C2=A0	/*
> =C2=A0	 * if "ibm,process-mmio" doesn't exist then per-process mmio
> is
> @@ -256,12 +207,6 @@ int cxl_of_read_afu_properties(struct cxl_afu
> *afu, struct device_node *np)
> =C2=A0	else
> =C2=A0		afu->pp_psa =3D false;
> =C2=A0
> -	if (cxl_verbose) {
> -		read_prop_dword(np, "ibm,supports-aur", &val);
> -		read_prop_dword(np, "ibm,supports-csrp", &val);
> -		read_prop_dword(np, "ibm,supports-prr", &val);
> -	}
> -
> =C2=A0	prop =3D read_prop_dword(np, "ibm,function-error-interrupt",
> &val);
> =C2=A0	if (prop)
> =C2=A0		afu->serr_hwirq =3D val;
> @@ -343,49 +288,15 @@ int cxl_of_read_adapter_handle(struct cxl
> *adapter, struct device_node *np)
> =C2=A0
> =C2=A0int cxl_of_read_adapter_properties(struct cxl *adapter, struct
> device_node *np)
> =C2=A0{
> -	int rc, len, naddr, i;
> -	char *p;
> +	int rc;
> =C2=A0	const __be32 *prop;
> =C2=A0	u32 val =3D 0;
> =C2=A0
> =C2=A0	/* Properties are read in the same order as listed in PAPR
> */
> =C2=A0
> -	naddr =3D of_n_addr_cells(np);
> -
> -	if (cxl_verbose) {
> -		pr_info("Dump of the 'ibm,coherent-platform-
> facility' node properties:\n");
> -
> -		read_prop_dword(np, "#address-cells", &val);
> -		read_prop_dword(np, "#size-cells", &val);
> -
> -		prop =3D of_get_property(np, "compatible", &len);
> -		i =3D 0;
> -		while (i < len) {
> -			p =3D (char *) prop + i;
> -			pr_info("compatible: %s\n", p);
> -			i +=3D strlen(p) + 1;
> -		}
> -		read_prop_string(np, "name");
> -		read_prop_string(np, "model");
> -
> -		prop =3D of_get_property(np, "reg", NULL);
> -		if (prop) {
> -			pr_info("reg: addr:%#llx size:%#x\n",
> -				of_read_number(prop, naddr),
> -				be32_to_cpu(prop[naddr]));
> -		}
> -
> -		read_prop_string(np, "ibm,loc-code");
> -	}
> -
> =C2=A0	if ((rc =3D read_adapter_irq_config(adapter, np)))
> =C2=A0		return rc;
> =C2=A0
> -	if (cxl_verbose) {
> -		read_prop_string(np, "device_type");
> -		read_prop_string(np, "ibm,phandle");
> -	}
> -
> =C2=A0	prop =3D read_prop_dword(np, "ibm,caia-version", &val);
> =C2=A0	if (prop) {
> =C2=A0		adapter->caia_major =3D (val & 0xFF00) >> 8;
> @@ -411,12 +322,6 @@ int cxl_of_read_adapter_properties(struct cxl
> *adapter, struct device_node *np)
> =C2=A0	if (prop)
> =C2=A0		adapter->guest->device =3D val;
> =C2=A0
> -	if (cxl_verbose) {
> -		read_prop_dword(np, "ibm,privileged-facility",
> &val);
> -		read_prop_dword(np, "revision-id", &val);
> -		read_prop_dword(np, "class-code", &val);
> -	}
> -
> =C2=A0	prop =3D read_prop_dword(np, "subsystem-vendor-id", &val);
> =C2=A0	if (prop)
> =C2=A0		adapter->guest->subsystem_vendor =3D val;
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

