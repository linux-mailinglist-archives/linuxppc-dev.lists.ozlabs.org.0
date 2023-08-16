Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E677E68E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 18:38:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BwGd5E24;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQv2b5n7sz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 02:38:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BwGd5E24;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQv1h4Pftz307V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 02:37:28 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RQv1h450Rz4wy9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 02:37:28 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RQv1h3nQHz4wy8; Thu, 17 Aug 2023 02:37:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BwGd5E24;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RQv1h1Rz9z4wy7;
	Thu, 17 Aug 2023 02:37:27 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GGUY4Z005019;
	Wed, 16 Aug 2023 16:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Ibp385JnoBcZ6jvg2AaVJonO5BuqByUnlv1udXjKaA4=;
 b=BwGd5E24Vvw82i8FoMpCj0ACugqOmN7VwqxtsJV9XrSeb0HNcR79HcVuYFOP8sNprRpl
 lE1RsCvlkpGBfCfAyzIGEd/8HmfEsWTc3YAAVfTh3G1AkZbI45q9ABa6yMBF+Dt4sgYL
 iptvNVgqfBMg+LNiisL7WgumIHywgWZ+CU5H7v35U5iTxMi0BbJISA4rUaLx43yNTR2n
 a7jPKezAO1feX4UeAZ+BvY8yWeFWqiXM9zXsHoNeb84zETEApUVi6UAbTS/AL6gkq3FK
 t67+Tp0WWW2XbKes6Zt+179ZfhbCghoDIIcaO9k7Qw/BqlyJmRgE0Mg7yldD7MBXIsYn 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sh21s8cpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 16:37:24 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37GGUWdv004929;
	Wed, 16 Aug 2023 16:37:24 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sh21s8cfj-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 16:37:24 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GGKigo001107;
	Wed, 16 Aug 2023 16:23:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsyencw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 16:23:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GGNeFi59638210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 16:23:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB64B2004B;
	Wed, 16 Aug 2023 16:23:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E47D520040;
	Wed, 16 Aug 2023 16:23:38 +0000 (GMT)
Received: from in.ibm.com (unknown [9.179.28.56])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Aug 2023 16:23:38 +0000 (GMT)
Date: Wed, 16 Aug 2023 21:53:36 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v8 1/2] powerpc/rtas: Rename rtas_error_rc to
 rtas_generic_errno
Message-ID: <xzsx7qc3el674iyy2lsn3adm7j2vh5xj6cjaqxgjm6lwcjiz5u@evoqbrvhqf26>
References: <169138864808.65607.6576358707894823512.stgit@jupiter>
 <877cpxdksx.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cpxdksx.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5Q9Eaz1-EdTThe7l4u5wwMMxXKFFoBwM
X-Proofpoint-ORIG-GUID: mtVxtPi6sB5V_LpbvsquRhNrQKhxLoNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_17,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308160145
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
Reply-To: mahesh@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci <linux-pci@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-08-15 13:52:14 Tue, Michael Ellerman wrote:
> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> > rtas_generic_errno() function will convert the generic rtas return codes
> > into errno.
> 
> I don't see the point of renaming it, it just creates unnecessary churn.
> The existing name seems OK to me.

Sure. Will revert back to existing name.

> 
> ...
> 
> > diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> > index 3abe15ac79db1..5572a0a2f6e18 100644
> > --- a/arch/powerpc/include/asm/rtas.h
> > +++ b/arch/powerpc/include/asm/rtas.h
> > @@ -202,7 +202,9 @@ typedef struct {
> >  #define RTAS_USER_REGION_SIZE (64 * 1024)
> >  
> >  /* RTAS return status codes */
> > -#define RTAS_BUSY		-2    /* RTAS Busy */
> > +#define RTAS_HARDWARE_ERROR	(-1)  /* Hardware Error */
> > +#define RTAS_BUSY		(-2)  /* RTAS Busy */
> 
> Are the brackets necessary?

During v5 changset I received offline review comment to add brackets,
hence continued here as well. I can take it away if Nathan is fine with
it.

> 
> > +#define RTAS_INVALID_PARAMETER	(-3)  /* Invalid indicator/domain/sensor etc. */
> >  #define RTAS_EXTENDED_DELAY_MIN	9900
> >  #define RTAS_EXTENDED_DELAY_MAX	9905
> >  
> > @@ -212,6 +214,11 @@ typedef struct {
> >  #define RTAS_THREADS_ACTIVE     -9005 /* Multiple processor threads active */
> >  #define RTAS_OUTSTANDING_COPROC -9006 /* Outstanding coprocessor operations */
> >  
> > +/* statuses specific to get-sensor-state */
> > +#define RTAS_SLOT_UNISOLATED		(-9000)
> > +#define RTAS_SLOT_NOT_UNISOLATED	(-9001)
> > +#define RTAS_SLOT_NOT_USABLE		(-9002)
> 
> These aren't specific to get-sensor-state.
> 
> They're used by at least: ibm,manage-flash-image, ibm,activate-firmware,
> ibm,configure-connector, set-indicator etc.
> 
> They have different meanings for those calls. I think you're best to
> just leave the constant values in rtas_error_rc().

Sure, I will leave them as constant in rtas_error_rc() and move these
three #defines to drivers/pci/hotplug/rpaphp_pci.c in 2/2 patch where it
makes sense.

> 
> >  /* RTAS event classes */
> >  #define RTAS_INTERNAL_ERROR		0x80000000 /* set bit 0 */
> >  #define RTAS_EPOW_WARNING		0x40000000 /* set bit 1 */
> > @@ -425,6 +432,7 @@ extern int rtas_set_indicator(int indicator, int index, int new_value);
> >  extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
> >  extern void rtas_progress(char *s, unsigned short hex);
> >  int rtas_ibm_suspend_me(int *fw_status);
> > +int rtas_generic_errno(int rtas_rc);
> >  
> >  struct rtc_time;
> >  extern time64_t rtas_get_boot_time(void);
> > diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> > index c087eeee320ff..80b6099e8ce20 100644
> > --- a/arch/powerpc/kernel/rtas.c
> > +++ b/arch/powerpc/kernel/rtas.c
> > @@ -1330,33 +1330,34 @@ bool __ref rtas_busy_delay(int status)
> >  }
> >  EXPORT_SYMBOL_GPL(rtas_busy_delay);
> >  
> > -static int rtas_error_rc(int rtas_rc)
> > +int rtas_generic_errno(int rtas_rc)
> >  {
> >  	int rc;
> >  
> >  	switch (rtas_rc) {
> > -		case -1: 		/* Hardware Error */
> > -			rc = -EIO;
> > -			break;
> > -		case -3:		/* Bad indicator/domain/etc */
> > -			rc = -EINVAL;
> > -			break;
> > -		case -9000:		/* Isolation error */
> > -			rc = -EFAULT;
> > -			break;
> > -		case -9001:		/* Outstanding TCE/PTE */
> > -			rc = -EEXIST;
> > -			break;
> > -		case -9002:		/* No usable slot */
> > -			rc = -ENODEV;
> > -			break;
> > -		default:
> > -			pr_err("%s: unexpected error %d\n", __func__, rtas_rc);
> > -			rc = -ERANGE;
> > -			break;
> > +	case RTAS_HARDWARE_ERROR:	/* Hardware Error */
> > +		rc = -EIO;
> > +		break;
> > +	case RTAS_INVALID_PARAMETER:	/* Bad indicator/domain/etc */
> > +		rc = -EINVAL;
> > +		break;
> > +	case RTAS_SLOT_UNISOLATED:	/* Isolation error */
> > +		rc = -EFAULT;
> > +		break;
> > +	case RTAS_SLOT_NOT_UNISOLATED:	/* Outstanding TCE/PTE */
> > +		rc = -EEXIST;
> > +		break;
> > +	case RTAS_SLOT_NOT_USABLE:	/* No usable slot */
> > +		rc = -ENODEV;
> > +		break;
> > +	default:
> > +		pr_err("%s: unexpected error %d\n", __func__, rtas_rc);
> > +		rc = -ERANGE;
> > +		break;
> >  	}
> >  	return rc;
> >  }
> > +EXPORT_SYMBOL(rtas_generic_errno);
>   
> Should be GPL.

Will fix it in next revision.

Thanks for your review.
-- 
Mahesh J Salgaonkar
