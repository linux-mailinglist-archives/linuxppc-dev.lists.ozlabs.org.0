Return-Path: <linuxppc-dev+bounces-15163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5758DCEF0F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 18:26:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djVwB6TsJz2xrC;
	Sat, 03 Jan 2026 04:26:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767374762;
	cv=none; b=XwHbFUQecdPG8xXWMNyUazxJmhAlFOCPIfCkQRdR0pSupUMupVfwNg9XlwbUgJJikDDd98Hjm+u8g3u4F5wizpUVrXIOEA5vs0TZWjXt+kD/UXQmZuJPUs1L3acFpqk7ke58lFD0ErKQnZCfbAer2dyt3szwhVchqWOSb7CY6Rj+EjIcUC/oIiH3L7IGlqckUXHG1mF5dfbUyb6aX3VqZ06+ci7HMNC+eK+lQzP+4gZQ8sHZZiBLteY+ATHlA7WKw5rxb0QztTYVkj48n2A6IoA6/h5obMHq7CFZTPWZCDlNiwSoXlpSbwrMpbNFZVKq/Fubyn/DpWolB3f5Pdoh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767374762; c=relaxed/relaxed;
	bh=CWlFBPTtZrUhjouODv1c0E4s2OhmsZMASuNBkm3Qa5c=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ej46AEtOm4YkRO+Xu7TqOHuadtn6e/p2lo7+CUv4olhLulN19JLYhRo9tZW1YgfXBJprc9hnNMgs5LekddWUQVwUwjcr0fyh9K/OG9USai97GmAwiFWBtpzdVSCBYcSex6EIqQ/6FkcEhE1nWZeAHPJ3tpolHAnWqYTo2rXIkjHDgOJ4qZffwGSY03UmRvmlBJOT9Supw4+CCrwNRz5aC8tdJ/9jXvPNek20MhxQeGF4WuA2//HUivu7UGBvSVbjZZ6kCNL9Iebm7I8ao4RdAigY7wxCQqydTdX57OUJOnI0wXOAm/jzj8RHLg6+pZcxy3REnDtgPd60zJ6iitDr2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aZX491X0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aZX491X0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djVw945nkz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 04:26:01 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 602HONnL004003;
	Fri, 2 Jan 2026 17:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CWlFBP
	TtZrUhjouODv1c0E4s2OhmsZMASuNBkm3Qa5c=; b=aZX491X0P5o6ZzzKavAE3o
	nJxwiUchF+5sLMLYiJLt6VPkr9f1hbdFbkM+AH3b2bmD6GHUJ89bY/gL+z6IgFwW
	ViC0qGJobmi0xqVI2A2qRwMBBRDCK/FjGgHDLFJRNvRzmyJkjPBayjVNJkjUEKU0
	aU+cgdGWescfWH1byU9nrYnBEviUHfVQS5LncqRo8juRNPdMAQq52+qyfYbg4jea
	8qREdL5BAp6w+IX+KvYAP55O6F0htkO9hoevUrW9K3NNltJfSzQJvyQx3NQgzcy9
	6vwFkbwi6btw8QGs49C+juBsU3jzAGlB29j0JiS2+WJ7+6zdVF2fonsXw6nYu1/w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w59cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:25:48 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 602HPlBI006987;
	Fri, 2 Jan 2026 17:25:48 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w59cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:25:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 602EeA1M023899;
	Fri, 2 Jan 2026 17:25:47 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bat5yqhnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 17:25:47 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 602HPjWR28050072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Jan 2026 17:25:45 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 975965805D;
	Fri,  2 Jan 2026 17:25:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF0ED58043;
	Fri,  2 Jan 2026 17:25:44 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.43.105])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Jan 2026 17:25:44 +0000 (GMT)
Message-ID: <d0d9315f3d907bd6bb172278e2746eda3482b475.camel@linux.ibm.com>
Subject: Re: [PATCH v2 4/6] pseries/plpks: add HCALLs for PowerVM Key
 Wrapping Module
From: Mimi Zohar <zohar@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
In-Reply-To: <20251217172505.112398-5-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
	 <20251217172505.112398-5-ssrish@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jan 2026 12:25:44 -0500
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
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uUUnpp3GdA4C9stzejbB-QHojUwKToFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDE1NCBTYWx0ZWRfX3obeWX3ANHib
 nkBYkfRDar36ygYP9fWWjgv9gqdljJ9RHSQnrObwcB0MYHcKdnj9iwkzajmhwdpUbJApa/hQyEs
 +llkde6wEly2AcrWg5dKgSf6eY9LtKfG1h1MSXH81tFCktaY+/dNRdlZqqd3dhEWpp4xan99h1U
 B+C7/TTPz7Ro311LV9cdoR5KlP/HAvRYH+V2lYpd6kl4+APARN5C5dVGssKH5wjyAH8uMzOJovD
 ScHvMqPczYsCy0LItg7vC3rf575ZzdEMpCNeXbekXOpmOUd/fCcx1pmgwZSyCXkjkq4ppiGZEKE
 SBb2E6q58pYDuwh+hgmPTLeT0iYGv+oBzxLq2/7J7kMwKPf/u/5tNVaaStWZ9+l/GOSDn4NWynF
 jR3OPrnGPsfzcj4mrQHF6MrUbvzAj9hwUFtcYZW4ATjARPKNE1DrVfbaLxnzdDnH+wGFoi5Gq6u
 pK9CbBHOJRFCG9I3bsQ==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=6957ff9c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=PyqcxcYqWu9aKqbE-8cA:9 a=ViHw82dsJJ-CUmMY:21
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9f9bQKuXxiQanf_EEaSefn3F0NiCQ8H_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601020154
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Srish,

On Wed, 2025-12-17 at 22:55 +0530, Srish Srinivasan wrote:
> The hypervisor generated wrapping key is an AES-GCM-256 symmetric key whi=
ch
> is stored in a non-volatile, secure, and encrypted storage called the Pow=
er
> LPAR Platform KeyStore. It has policy based protections that prevent it
> from being read out or exposed to the user.
>=20
> Implement H_PKS_GEN_KEY, H_PKS_WRAP_OBJECT, and H_PKS_UNWRAP_OBJECT HCALL=
s
> to enable using the PowerVM Key Wrapping Module (PKWM) as a new trust
> source for trusted keys. Disallow H_PKS_READ_OBJECT, H_PKS_SIGNED_UPDATE,
> and H_PKS_WRITE_OBJECT for objects with the 'wrapping key' policy set.
> Capture the availability status for the H_PKS_WRAP_OBJECT interface.
>=20
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>

scripts/checkpatch.pl --codespell caught a couple of typos.  Please fix the
typos here in in this patch and the one in v2 5/6.

> ---
>  Documentation/arch/powerpc/papr_hcalls.rst |  43 +++
>  arch/powerpc/include/asm/plpks.h           |  10 +
>  arch/powerpc/platforms/pseries/plpks.c     | 345 ++++++++++++++++++++-
>  3 files changed, 396 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/a=
rch/powerpc/papr_hcalls.rst
> index 805e1cb9bab9..14e39f095a1c 100644
> --- a/Documentation/arch/powerpc/papr_hcalls.rst
> +++ b/Documentation/arch/powerpc/papr_hcalls.rst
> @@ -300,6 +300,49 @@ H_HTM supports setup, configuration, control and dum=
ping of Hardware Trace
>  Macro (HTM) function and its data. HTM buffer stores tracing data for fu=
nctions
>  like core instruction, core LLAT and nest.
> =20
> +**H_PKS_GEN_KEY**
> +
> +| Input: authorization, objectlabel, objectlabellen, policy, out, outlen
> +| Out: *Hypervisor Generated Key, or None when the wrapping key policy i=
s set*
> +| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter,=
 H_P2,
> +                H_P3, H_P4, H_P5, H_P6, H_Authority, H_Nomem, H_Busy, H_=
Resource,
> +                H_Aborted*
> +
> +H_PKS_GEN_KEY is used to have the hypervisor generate a new random key.
> +This key is stored as an object in the Power LPAR Platform KeyStore with
> +the provided object label. With the wrapping key policy set the key is o=
nly
> +visible to the hypervisor, while the key's label would still be visible =
to
> +the user. Generation of wrapping keys is supported only for a key size o=
f
> +32 bytes.
> +
> +**H_PKS_WRAP_OBJECT**
> +
> +| Input: authorization, wrapkeylabel, wrapkeylabellen, objectwrapflags, =
in,
> +|        inlen, out, outlen, continue-token
> +| Out: *continue-token, byte size of wrapped object, wrapped object*
> +| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter,=
 H_P2,
> +                H_P3, H_P4, H_P5, H_P6, H_P7, H_P8, H_P9, H_Authority, H=
_Invalid_Key,
> +                H_NOT_FOUND, H_Busy, H_LongBusy, H_Aborted*
> +
> +H_PKS_WRAP_OBJECT is used to wrap an object using a wrapping key stored =
in the
> +Power LPAR Platform KeyStore and return the wrapped object to the caller=
. The
> +caller provides a label to a wrapping key with the 'wrapping key' policy=
 set,
> +which must have been previously created with H_PKS_GEN_KEY. The provided=
 object
> +is then encrypted with the wrapping key and additional metadata and the =
result
> +is returned to the caller.
> +
> +
> +**H_PKS_UNWRAP_OBJECT**
> +
> +| Input: authorization, objectwrapflags, in, inlen, out, outlen, continu=
e-token
> +| Out: *continue-token, byte size of unwrapped object, unwrapped object*
> +| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter,=
 H_P2,
> +                H_P3, H_P4, H_P5, H_P6, H_P7, H_Authority, H_Unsupported=
, H_Bad_Data,
> +                H_NOT_FOUND, H_Invalid_Key, H_Busy, H_LongBusy, H_Aborte=
d*
> +
> +H_PKS_UNWRAP_OBJECT is used to unwrap an object that was previously wara=
pped with
> +H_PKS_WRAP_OBJECT.
> +
>  References
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  .. [1] "Power Architecture Platform Reference"
> diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/=
plpks.h
> index 8f034588fdf7..e87f90e40d4e 100644
> --- a/arch/powerpc/include/asm/plpks.h
> +++ b/arch/powerpc/include/asm/plpks.h
> @@ -113,6 +113,16 @@ void plpks_early_init_devtree(void);
>  int plpks_populate_fdt(void *fdt);
> =20
>  int plpks_config_create_softlink(struct kobject *from);
> +
> +bool plpks_wrapping_is_supported(void);
> +
> +int plpks_gen_wrapping_key(void);
> +
> +int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
> +		      u8 **output_buf, u32 *output_len);
> +
> +int plpks_unwrap_object(u8 **input_buf, u32 input_len,
> +			u8 **output_buf, u32 *output_len);
>  #else // CONFIG_PSERIES_PLPKS
>  static inline bool plpks_is_available(void) { return false; }
>  static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platfo=
rms/pseries/plpks.c
> index 4a08f51537c8..2ec04908b057 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -9,6 +9,32 @@
> =20
>  #define pr_fmt(fmt) "plpks: " fmt
> =20
> +#define PLPKS_WRAPKEY_COMPONENT	"PLPKSWR"
> +#define PLPKS_WRAPKEY_NAME	"default-wrapping-key"
> +
> +/*
> + * To 4K align the {input, output} buffers to the {UN}WRAP H_CALLs
> + */
> +#define PLPKS_WRAPPING_BUF_ALIGN	4096
> +
> +/*
> + * To ensure the output buffer's length is at least 1024 bytes greater
> + * than the input buffer's length during the WRAP H_CALL
> + */
> +#define PLPKS_WRAPPING_BUF_DIFF	1024
> +
> +#define PLPKS_WRAP_INTERFACE_BIT	3
> +#define PLPKS_WRAPPING_KEY_LENGTH	32
> +
> +#define WRAPFLAG_BE_BIT_SET(be_bit) \
> +	BIT_ULL(63 - (be_bit))
> +
> +#define WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo) \
> +	GENMASK_ULL(63 - (be_bit_hi), 63 - (be_bit_lo))
> +
> +#define WRAPFLAG_BE_FIELD_PREP(be_bit_hi, be_bit_lo, val) \
> +	FIELD_PREP(WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo), (val))
> +
>  #include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
> @@ -39,6 +65,7 @@ static u32 supportedpolicies;
>  static u32 maxlargeobjectsize;
>  static u64 signedupdatealgorithms;
>  static u64 wrappingfeatures;
> +static bool wrapsupport;
> =20
>  struct plpks_auth {
>  	u8 version;
> @@ -283,6 +310,7 @@ static int _plpks_get_config(void)
>  	maxlargeobjectsize =3D be32_to_cpu(config->maxlargeobjectsize);
>  	signedupdatealgorithms =3D be64_to_cpu(config->signedupdatealgorithms);
>  	wrappingfeatures =3D be64_to_cpu(config->wrappingfeatures);
> +	wrapsupport =3D config->flags & PPC_BIT8(PLPKS_WRAP_INTERFACE_BIT);
> =20
>  	// Validate that the numbers we get back match the requirements of the =
spec
>  	if (maxpwsize < 32) {
> @@ -614,6 +642,9 @@ int plpks_signed_update_var(struct plpks_var *var, u6=
4 flags)
>  	if (!(var->policy & PLPKS_SIGNEDUPDATE))
>  		return -EINVAL;
> =20
> +	if (var->policy & PLPKS_WRAPPINGKEY)
> +		return -EINVAL;
> +
>  	// Signed updates need the component to be NULL.
>  	if (var->component)
>  		return -EINVAL;
> @@ -696,6 +727,9 @@ int plpks_write_var(struct plpks_var var)
>  	if (var.policy & PLPKS_SIGNEDUPDATE)
>  		return -EINVAL;
> =20
> +	if (var.policy & PLPKS_WRAPPINGKEY)
> +		return -EINVAL;
> +
>  	auth =3D construct_auth(PLPKS_OS_OWNER);
>  	if (IS_ERR(auth))
>  		return PTR_ERR(auth);
> @@ -790,6 +824,9 @@ static int plpks_read_var(u8 consumer, struct plpks_v=
ar *var)
>  	if (var->namelen > PLPKS_MAX_NAME_SIZE)
>  		return -EINVAL;
> =20
> +	if (var->policy & PLPKS_WRAPPINGKEY)
> +		return -EINVAL;
> +
>  	auth =3D construct_auth(consumer);
>  	if (IS_ERR(auth))
>  		return PTR_ERR(auth);
> @@ -845,8 +882,312 @@ static int plpks_read_var(u8 consumer, struct plpks=
_var *var)
>  }
> =20
>  /**
> - * plpks_read_os_var() - Fetch the data for the specified variable that =
is
> - * owned by the OS consumer.
> + * plpks_wrapping_is_supported() - Get the H_PKS_WRAP_OBJECT interface
> + * availability status for the LPAR.
> + *
> + * Successful execution of the H_PKS_GET_CONFIG HCALL during initializat=
ion
> + * sets bit 3 of the flags variable in the PLPKS config structure if the
> + * H_PKS_WRAP_OBJECT interface is supported.
> + *
> + * Returns: true if the H_PKS_WRAP_OBJECT interface is supported, false =
if not.
> + */
> +bool plpks_wrapping_is_supported(void)
> +{
> +	return wrapsupport;
> +}
> +
> +/**
> + * plpks_gen_wrapping_key() - Generate a new random key with the 'wrappi=
ng key'
> + * policy set.
> + *
> + * The H_PKS_GEN_KEY HCALL makes the hypervisor generate a new random ke=
y and
> + * store the key in a PLPKS object with the provided object label. With =
the
> + * 'wrapping key' policy set, only the label to the newly generated rand=
om key
> + * would be visible to the user.
> + *
> + * Possible reasons for the returned errno values:
> + *
> + * -ENXIO	if PLPKS is not supported
> + * -EIO		if PLPKS access is blocked due to the LPAR's state
> + *		if PLPKS modification is blocked due to the LPAR's state
> + *		if an error occurred while processing the request
> + * -EINVAL	if invalid authorization parameter
> + *		if invalid object label parameter
> + *		if invalid object label len parameter
> + *		if invalid or unsupported policy declaration
> + *		if invalid output buffer parameter
> + *		if invalid output buffer length parameter
> + * -EPERM	if access is denied
> + * -ENOMEM	if there is inadequate memory to perform this operation
> + * -EBUSY	if unable to handle the request
> + * -EEXIST	if the object label already exists
> + *
> + * Returns: On success 0 is returned, a negative errno if not.
> + */
> +int plpks_gen_wrapping_key(void)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] =3D { 0 };
> +	struct plpks_auth *auth;
> +	struct label *label;
> +	int rc =3D 0, pseries_status =3D 0;
> +	struct plpks_var var =3D {
> +		.name =3D PLPKS_WRAPKEY_NAME,
> +		.namelen =3D strlen(var.name),
> +		.policy =3D PLPKS_WRAPPINGKEY,
> +		.os =3D PLPKS_VAR_LINUX,
> +		.component =3D PLPKS_WRAPKEY_COMPONENT
> +	};
> +
> +	auth =3D construct_auth(PLPKS_OS_OWNER);
> +	if (IS_ERR(auth))
> +		return PTR_ERR(auth);
> +
> +	label =3D construct_label(var.component, var.os, var.name, var.namelen)=
;
> +	if (IS_ERR(label)) {
> +		rc =3D PTR_ERR(label);
> +		goto out;
> +	}
> +
> +	rc =3D plpar_hcall(H_PKS_GEN_KEY, retbuf,
> +			 virt_to_phys(auth), virt_to_phys(label),
> +			 label->size, var.policy,
> +			 NULL, PLPKS_WRAPPING_KEY_LENGTH);
> +
> +	if (!rc)
> +		rc =3D plpks_confirm_object_flushed(label, auth);
> +
> +	pseries_status =3D rc;
> +	rc =3D pseries_status_to_err(rc);
> +
> +	if (rc && rc !=3D -EEXIST) {
> +		pr_err("H_PKS_GEN_KEY failed.");
> +		pr_err("pseries_status =3D %d, error code =3D %d", pseries_status,
> +		       rc);
> +	} else {
> +		rc =3D 0;
> +	}
> +
> +	kfree(label);
> +out:
> +	kfree(auth);
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(plpks_gen_wrapping_key);
> +
> +/**
> + * plpks_wrap_object() - Wrap an object using the default wrapping key s=
tored in
> + * the PLPKS.
> + * @input_buf: buffer containing the data to be wrapped
> + * @input_len: length of the input buffer
> + * @wrap_flags: object wrapping flags
> + * @output_buf: buffer to store the wrapped data
> + * @output_len: length of the output buffer
> + *
> + * The H_PKS_WRAP_OBJECT HCALL wraps an object using a wrapping key stor=
ed in
> + * the PLPKS and returns the wrapped object to the caller. The caller pr=
ovides a
> + * label to the wrapping key with the 'wrapping key' policy set that mus=
t have
> + * been previously created with the H_PKS_GEN_KEY HCALL. The provided ob=
ject is
> + * then encrypted with the wrapping key and additional metadata and the =
result
> + * is returned to the user. The metadata includes the wrapping algorithm=
 and the
> + * wrapping key name so those parameters are not required during unwrap.
> + *
> + * Possible reasons for the returned errno values:
> + *
> + * -ENXIO	if PLPKS is not supported
> + * -EIO		if PLPKS access is blocked due to the LPAR's state
> + *		if PLPKS modification is blocked due to the LPAR's state
> + *		if an error occurred while processing the request
> + * -EINVAL	if invalid authorization parameter
> + *		if invalid wraping key label parameter

-> wrapping=20

> + *		if invalid wrapping key label length parameter
> + *		if invalid or unsupported object wrapping flags
> + *		if invalid inut buffer parameter

-> input
> + *		if invalid input buffer length parameter
> + *		if invalid output buffer parameter
> + *		if invalid output buffer length parameter
> + *		if invalid continue token parameter
> + *		if the wrapping key is not compatible with the wrapping
> + *		algorithm
> + * -EPERM	if access is denied
> + * -ENOENT	if the requested wrapping key was not found
> + * -EBUSY	if unable to handle the request or long running operation
> + *		initiated, retry later.
> + *
> + * Returns: On success 0 is returned, a negative errno if not.
> + */
> +int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
> +		      u8 **output_buf, u32 *output_len)
> +{
> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] =3D { 0 };
> +	struct plpks_auth *auth;
> +	struct label *label;
> +	u64 continuetoken =3D 0;
> +	u64 objwrapflags =3D 0;
> +	int rc =3D 0, pseries_status =3D 0;
> +	bool sb_audit_or_enforce_bit =3D wrap_flags & BIT(0);
> +	bool sb_enforce_bit =3D wrap_flags & BIT(1);
> +	struct plpks_var var =3D {
> +		.name =3D PLPKS_WRAPKEY_NAME,
> +		.namelen =3D strlen(var.name),
> +		.os =3D PLPKS_VAR_LINUX,
> +		.component =3D PLPKS_WRAPKEY_COMPONENT
> +	};
> +
> +	auth =3D construct_auth(PLPKS_OS_OWNER);
> +	if (IS_ERR(auth))
> +		return PTR_ERR(auth);
> +
> +	label =3D construct_label(var.component, var.os, var.name, var.namelen)=
;
> +	if (IS_ERR(label)) {
> +		rc =3D PTR_ERR(label);
> +		goto out;
> +	}
> +
> +	/* Set the consumer password requirement bit. A must have. */
> +	objwrapflags |=3D WRAPFLAG_BE_BIT_SET(3);
> +
> +	/* Set the wrapping algorithm bit. Just one algorithm option for now */
> +	objwrapflags |=3D WRAPFLAG_BE_FIELD_PREP(60, 63, 0x1);
> +
> +	if (sb_audit_or_enforce_bit & sb_enforce_bit) {
> +		pr_err("Cannot set both audit/enforce and enforce bits.");
> +		rc =3D -EINVAL;
> +		goto out_free_label;
> +	} else if (sb_audit_or_enforce_bit) {
> +		objwrapflags |=3D WRAPFLAG_BE_BIT_SET(1);
> +	} else if (sb_enforce_bit) {
> +		objwrapflags |=3D WRAPFLAG_BE_BIT_SET(2);
> +	}
> +
> +	*output_len =3D input_len + PLPKS_WRAPPING_BUF_DIFF;
> +
> +	*output_buf =3D kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
> +			      GFP_KERNEL);
> +	if (!(*output_buf)) {
> +		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
> +		rc =3D -ENOMEM;
> +		goto out_free_label;
> +	}
> +
> +	do {
> +		rc =3D plpar_hcall9(H_PKS_WRAP_OBJECT, retbuf,
> +				  virt_to_phys(auth), virt_to_phys(label),
> +				  label->size, objwrapflags,
> +				  virt_to_phys(*input_buf), input_len,
> +				  virt_to_phys(*output_buf), *output_len,
> +				  continuetoken);
> +
> +		continuetoken =3D retbuf[0];
> +		pseries_status =3D rc;
> +		rc =3D pseries_status_to_err(rc);
> +	} while (rc =3D=3D -EBUSY);
> +
> +	if (rc) {
> +		pr_err("H_PKS_WRAP_OBJECT failed.");
> +		pr_err("pseries_status =3D %d, return code =3D %d", pseries_status,
> +		       rc);
> +		kfree(*output_buf);
> +		*output_buf =3D NULL;
> +	} else {
> +		*output_len =3D retbuf[1];
> +	}
> +
> +out_free_label:
> +	kfree(label);
> +out:
> +	kfree(auth);
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(plpks_wrap_object);
> +
> +/**
> + * plpks_unwrap_object() - Unwrap an object using the default wrapping k=
ey
> + * stored in the PLPKS.
> + * @input_buf: buffer containing the data to be unwrapped
> + * @input_len: length of the input buffer
> + * @output_buf: buffer to store the unwrapped data
> + * @output_len: length of the output buffer
> + *
> + * The H_PKS_UNWRAP_OBJECT HCALL unwraps an object that was previously w=
rapped
> + * using the H_PKS_WRAP_OBJECT HCALL.
> + *
> + * Possible reasons for the returned errno values:
> + *
> + * -ENXIO	if PLPKS is not supported
> + * -EIO		if PLPKS access is blocked due to the LPAR's state
> + *		if PLPKS modification is blocked due to the LPAR's state
> + *		if an error occurred while processing the request
> + * -EINVAL	if invalid authorization parameter
> + *		if invalid or unsupported object unwrapping flags
> + *		if invalid inut buffer parameter

-> input=20

> + *		if invalid input buffer length parameter
> + *		if invalid output buffer parameter
> + *		if invalid output buffer length parameter
> + *		if invalid continue token parameter
> + *		if the wrapping key is not compatible with the wrapping
> + *		algorithm
> + *		if the wrapped object's format is not supported
> + *		if the wrapped object is invalid
> + * -EPERM	if access is denied
> + * -ENOENT	if the wrapping key for the provided object was not found
> + * -EBUSY	if unable to handle the request or long running operation
> + *		initiated, retry later.
> + *
> + * Returns: On success 0 is returned, a negative errno if not.
> + */
> +int plpks_unwrap_object(u8 **input_buf, u32 input_len, u8 **output_buf,
> +			u32 *output_len)
> +{
> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] =3D { 0 };
> +	struct plpks_auth *auth;
> +	u64 continuetoken =3D 0;
> +	u64 objwrapflags =3D 0;
> +	int rc =3D 0, pseries_status =3D 0;
> +
> +	auth =3D construct_auth(PLPKS_OS_OWNER);
> +	if (IS_ERR(auth))
> +		return PTR_ERR(auth);
> +
> +	*output_len =3D input_len - PLPKS_WRAPPING_BUF_DIFF;
> +	*output_buf =3D kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
> +			      GFP_KERNEL);
> +	if (!(*output_buf)) {
> +		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
> +		rc =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	do {
> +		rc =3D plpar_hcall9(H_PKS_UNWRAP_OBJECT, retbuf,
> +				  virt_to_phys(auth), objwrapflags,
> +				  virt_to_phys(*input_buf), input_len,
> +				  virt_to_phys(*output_buf), *output_len,
> +				  continuetoken);
> +
> +		continuetoken =3D retbuf[0];
> +		pseries_status =3D rc;
> +		rc =3D pseries_status_to_err(rc);
> +	} while (rc =3D=3D -EBUSY);
> +
> +	if (rc) {
> +		pr_err("H_PKS_UNWRAP_OBJECT failed.");
> +		pr_err("pseries_status =3D %d, return code =3D %d", pseries_status,
> +		       rc);
> +		kfree(*output_buf);
> +		*output_buf =3D NULL;
> +	} else {
> +		*output_len =3D retbuf[1];
> +	}
> +
> +out:
> +	kfree(auth);
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(plpks_unwrap_object);
> +
> +/**
> + * plpks_read_os_var() - Fetch the data for the specified variable that =
is owned
> + * by the OS consumer.
>   * @var: variable to be read from the PLPKS
>   *
>   * The consumer or the owner of the object is the os kernel. The


