Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4F77E20F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 14:59:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlN282+e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQp9r1fhDz3cJR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 22:59:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlN282+e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQp8y3PWYz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 22:58:25 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GCvh1L032106;
	Wed, 16 Aug 2023 12:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=WmKNqt5RyLphEHTQ3PhyNwbR24W9Co9HoNVQhPeG+SU=;
 b=tlN282+ea6K8K19iQkBOd7thTBnMF9M7LVWNWzV5jMmItBzxqvaW41FXXJCdwKMxZIBI
 bSMXdsXgz1hJttPtQHs+/pzztqgUcf2N4IjiUTFQMN9fnVhRlmhGUPM/NbRcMxhAsKKm
 PpumHzYwDQEHKHcL3SRChhyoKtJ0to3nMVzdkJEVSCfymyPJf+fcDgbyy2TARYiL5Tcv
 j77mft8egkhtRD6CMGPsqvf+Y2rJW9Q8Ns5MfcBAOQnlGODFyurqq3KIGX4HEbJBEqt9
 NYWJ/kYK60PJOGcqSM3TCtw62MHm7zCSA7DmfPSMAhoB326PBg8HZ03GPWdxU+EB7QvG cA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgxx080p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 12:58:20 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GAvrJx001090;
	Wed, 16 Aug 2023 12:58:19 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsycm8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 12:58:19 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GCwIHa20185390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 12:58:18 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0886C5805B;
	Wed, 16 Aug 2023 12:58:18 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F1D05805E;
	Wed, 16 Aug 2023 12:58:17 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.61.190.160])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Aug 2023 12:58:17 +0000 (GMT)
Message-ID: <3b4024eb6602fc2b7be821e6e33c656eee3c7cae.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/6] integrity: ignore keys failing CA restrictions
 on non-UEFI platform
From: Mimi Zohar <zohar@linux.ibm.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
        linux-integrity@vger.kernel.org
Date: Wed, 16 Aug 2023 08:58:16 -0400
In-Reply-To: <CUSG8HX9J4L0.37OHE7QHLL9N7@suppilovahvero>
References: <20230813021531.1382815-1-nayna@linux.ibm.com>
	 <20230813021531.1382815-3-nayna@linux.ibm.com>
	 <CUSG8HX9J4L0.37OHE7QHLL9N7@suppilovahvero>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aJNxpgGI1i7q6w3pkC8aTvsLKU1rNLm9
X-Proofpoint-ORIG-GUID: aJNxpgGI1i7q6w3pkC8aTvsLKU1rNLm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_11,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308160110
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, linux-security-module@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-08-14 at 20:38 +0300, Jarkko Sakkinen wrote:
> On Sun Aug 13, 2023 at 5:15 AM EEST, Nayna Jain wrote:
> > On non-UEFI platforms, handle restrict_link_by_ca failures differently.
> >
> > Certificates which do not satisfy CA restrictions on non-UEFI platforms
> > are ignored.
> >
> > Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> > Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
> > ---
> >  security/integrity/platform_certs/machine_keyring.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/security/integrity/platform_certs/machine_keyring.c b/security/integrity/platform_certs/machine_keyring.c
> > index 7aaed7950b6e..389a6e7c9245 100644
> > --- a/security/integrity/platform_certs/machine_keyring.c
> > +++ b/security/integrity/platform_certs/machine_keyring.c
> > @@ -36,7 +36,7 @@ void __init add_to_machine_keyring(const char *source, const void *data, size_t
> >  	 * If the restriction check does not pass and the platform keyring
> >  	 * is configured, try to add it into that keyring instead.
> >  	 */
> > -	if (rc && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
> > +	if (rc && efi_enabled(EFI_BOOT) && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
> >  		rc = integrity_load_cert(INTEGRITY_KEYRING_PLATFORM, source,
> >  					 data, len, perm);
> >  
> > -- 
> > 2.31.1
> 
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

Hi Jarkko,

Without the following two commits in your master branch, the last patch
in this series "[PATCH v4 6/6] integrity: PowerVM support for loading
third party code signing keys"   doesn't apply cleanly.

- commit 409b465f8a83 ("integrity: Enforce digitalSignature usage in
the ima and evm keyrings")
- commit e34a6c7dd192 ("KEYS: DigitalSignature link restriction")

If you're not planning on upstreaming this patch set, I'd appreciate
your creating a topic branch with these two commits.

-- 
thanks,

Mimi

