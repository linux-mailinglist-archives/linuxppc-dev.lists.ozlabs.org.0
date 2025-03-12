Return-Path: <linuxppc-dev+bounces-6928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE44A5D648
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 07:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCLP53GxQz30W5;
	Wed, 12 Mar 2025 17:31:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741761065;
	cv=none; b=CbArz0TlRSIfIzu/Vc+XHcnSDfF8h3tKokwyAHcfbL54Prtp2Vde9xIJuwpzVHPqrzvahDwDc00IaUgI1XNolxH2uqCYZpu1k9bSwPg9naAD/3GqPcyZUfq1u0IPhXUrw3tkPbporWwJkC+lVg+BbTDF696gls5J0Y35Ele7LYqA1kiEvjlWBYnVhn3nBfKoDImNC7n98axJxTIgCJEMHMlxtA3QLgXo16dzrsodVEemAFzqX2iAy37uUW75KA2hVLtJpU54ckxEpCZFbQuu2CdzSO1bs8dZ3wBVN1hABauG4CJdVVfZiV3mtx3D52RaOJHOYQxpOxK8D6ntOYJGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741761065; c=relaxed/relaxed;
	bh=6tZpLYng3OBziE8gsJ8ssCwAfoL6SRRFjtoOtUsl/Tg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=Fb9jVaCLs4/qnPI0fmP9rurNsjD8zvSm8SVZlZJhXJa1/EVmOobrsRsAZSjrSRrVEwox00jd+6dcus2pZEAGPVc4PQ/jUGhuzuWu7IGMpSMYZ/c436BW7AcMOR8eMiiF2ywIuAl17+JojNlgk1h+ulPSZ6y7IMSCD0kLlbhbqKIAZ87sGD3xfVYhgoekARAZVWx9ELfwdN9stLKZWDZi0YCuevjHu8Hi5szEWkUr7N463Oi9kVfyga8B7YuZnFB5EJdAITqC/tnLLT7LJte8FV9nKzEohnO4xE+3AewULX8AUPs/VkA3PGUanrQ58zhkb5WCgAJmEcAAttYomJ4Yyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UcLJx5S6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UcLJx5S6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCLP15qpsz30Kg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 17:31:01 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BKcf5t004971;
	Wed, 12 Mar 2025 06:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6tZpLY
	ng3OBziE8gsJ8ssCwAfoL6SRRFjtoOtUsl/Tg=; b=UcLJx5S6nSq/YZad4xvYuX
	LJcONlU6MNxDd1zvgCA1DSj9H//d36RyhIop+Jg2PXpB3NsFxAc3ETO/JtguLefC
	AshaW68lsdEp2bS16S4UsDKJuY4daI08hG89zpumLxWJdfVYFvIIJxZhoZVa1qg2
	u4z4xaGadfxiqZIaovQ366R4PWFHwEmWrxSe0VYklJZYZdI3pFh8msmdQCqZN+K3
	AydKa9bT2e7vseQotgG50MUvgQQ33LpTv7ECnGKI2PILVbzJZbutzY1sLMGagc7Y
	oP+2fpQR5L07qzX37svzNWVSCrvyK7ZlCeAG80zbD3IbOBp24IRkjlcjsNcJSglw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45avcyt15e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 06:30:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52C6R2aB029252;
	Wed, 12 Mar 2025 06:30:52 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45avcyt15c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 06:30:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52C6Mg0n027172;
	Wed, 12 Mar 2025 06:30:51 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsqtmgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 06:30:51 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52C6Umm930606016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 06:30:48 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29D555805D;
	Wed, 12 Mar 2025 06:30:48 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E90A458053;
	Wed, 12 Mar 2025 06:30:46 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.74.78])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Mar 2025 06:30:46 +0000 (GMT)
Message-ID: <d25bfe9d18156adfc2ba656aea55a4b70d17b3bd.camel@linux.ibm.com>
Subject: Re: [PATCH v8 1/7] powerpc/pseries: Define common functions for
 RTAS sequence calls
From: Haren Myneni <haren@linux.ibm.com>
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
        tyreld@linux.ibm.com, hbabu@us.ibm.com, sv@linux.ibm.com
Date: Tue, 11 Mar 2025 23:30:46 -0700
In-Reply-To: <ao7wd4on2rdvhosbecyq2yb7agpop4cvluby6csxw6pi6s24fp@xtthgpv3noe7>
References: <20250311225049.146783-1-haren@linux.ibm.com>
	 <20250311225049.146783-2-haren@linux.ibm.com>
	 <ao7wd4on2rdvhosbecyq2yb7agpop4cvluby6csxw6pi6s24fp@xtthgpv3noe7>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IZ3lFeZmStTjN8X3kbdum4NaKhjAt8IL
X-Proofpoint-ORIG-GUID: gCZkinCO83a1dtWy5AOLj66wgZF5g4Po
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503120041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2025-03-12 at 10:55 +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Mar 11, 2025 at 03:50:42PM -0700, Haren Myneni wrote:
> > The RTAS call can be normal where retrieves the data form the
> > hypervisor once or sequence based RTAS call which has to
> > issue multiple times until the complete data is obtained. For
> > some of these sequence RTAS calls, the OS should not interleave
> > calls with different input until the sequence is completed.
> > The data is collected for each call and copy to the buffer
> > for the entire sequence during ioctl() handle and then expose
> > this buffer to the user space with read() handle.
> > 
> > One such sequence RTAS call is ibm,get-vpd and its support is
> > already included in the current code. To add the similar support
> > for other sequence based calls, move the common functions in to
> > separate file and update papr_rtas_sequence struct with the
> > following callbacks so that RTAS call specific code will be
> > defined and executed to complete the sequence.
> > 
> > struct papr_rtas_sequence {
> >         int error;
> >         void params;
> >         void (*begin) (struct papr_rtas_sequence *);
> >         void (*end) (struct papr_rtas_sequence *);
> >         const char * (*work) (struct papr_rtas_sequence *, size_t
> > *);
> > };
> > 
> > params: Input parameters used to pass for RTAS call.
> > Begin:	RTAS call specific function to initialize data
> > 	including work area allocation.
> > End:	RTAS call specific function to free up resources
> > 	(free work area) after the sequence is completed.
> > Work:	The actual RTAS call specific function which collects
> > 	the data from the hypervisor.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/Makefile       |   2 +-
> >  .../platforms/pseries/papr-rtas-common.c      | 310
> > ++++++++++++++++
> >  .../platforms/pseries/papr-rtas-common.h      |  61 +++
> >  arch/powerpc/platforms/pseries/papr-vpd.c     | 351 +++-----------
> > ----
> >  4 files changed, 416 insertions(+), 308 deletions(-)
> >  create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-
> > common.c
> >  create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-
> > common.h
> > 
> > diff --git a/arch/powerpc/platforms/pseries/Makefile
> > b/arch/powerpc/platforms/pseries/Makefile
> > index 7bf506f6b8c8..697c216b70dc 100644
> > --- a/arch/powerpc/platforms/pseries/Makefile
> > +++ b/arch/powerpc/platforms/pseries/Makefile
> > @@ -3,7 +3,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
> >  
> >  obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
> >  			   of_helpers.o rtas-work-area.o papr-sysparm.o 
> > \
> > -			   papr-vpd.o \
> > +			   papr-rtas-common.o papr-vpd.o \
> >  			   setup.o iommu.o event_sources.o ras.o \
> >  			   firmware.o power.o dlpar.o mobility.o rng.o
> > \
> >  			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
> > diff --git a/arch/powerpc/platforms/pseries/papr-rtas-common.c
> > b/arch/powerpc/platforms/pseries/papr-rtas-common.c
> > new file mode 100644
> > index 000000000000..2d0220209de0
> > --- /dev/null
> > +++ b/arch/powerpc/platforms/pseries/papr-rtas-common.c
> > @@ -0,0 +1,310 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#define pr_fmt(fmt) "papr-common: " fmt
> > +
> > +#include <linux/types.h>
> > +#include <linux/kernel.h>
> > +#include <linux/signal.h>
> > +#include <linux/slab.h>
> > +#include <linux/file.h>
> > +#include <linux/fs.h>
> > +#include <linux/anon_inodes.h>
> > +#include <linux/sched/signal.h>
> > +#include "papr-rtas-common.h"
> > +
> > +/*
> > + * Sequence based RTAS HCALL has to issue multiple times to
> > retrieve
> > + * complete data from the hypervisor. For some of these RTAS
> > calls,
> > + * the OS should not interleave calls with different input until
> > the
> > + * sequence is completed. So data is collected for these calls
> > during
> > + * ioctl handle and export to user space with read() handle.
> > + * This file provides common functions needed for such sequence
> > based
> > + * RTAS calls Ex: ibm,get-vpd and ibm,get-indices.
> > + */
> > +
> > +bool papr_rtas_blob_has_data(const struct papr_rtas_blob *blob)
> > +{
> > +	return blob->data && blob->len;
> > +}
> > +
> > +void papr_rtas_blob_free(const struct papr_rtas_blob *blob)
> > +{
> > +	if (blob) {
> > +		kvfree(blob->data);
> > +		kfree(blob);
> > +	}
> > +}
> > +
> > +/**
> > + * papr_rtas_blob_extend() - Append data to a &struct
> > papr_rtas_blob.
> > + * @blob: The blob to extend.
> > + * @data: The new data to append to @blob.
> > + * @len:  The length of @data.
> > + *
> > + * Context: May sleep.
> > + * Return: -ENOMEM on allocation failure, 0 otherwise.
> > + */
> > +static int papr_rtas_blob_extend(struct papr_rtas_blob *blob,
> > +				const char *data, size_t len)
> > +{
> > +	const size_t new_len = blob->len + len;
> > +	const size_t old_len = blob->len;
> > +	const char *old_ptr = blob->data;
> > +	char *new_ptr;
> > +
> > +	new_ptr = kvrealloc(old_ptr, new_len, GFP_KERNEL_ACCOUNT);
> > +	if (!new_ptr)
> > +		return -ENOMEM;
> > +
> > +	memcpy(&new_ptr[old_len], data, len);
> > +	blob->data = new_ptr;
> > +	blob->len = new_len;
> > +	return 0;
> > +}
> > +
> > +/**
> > + * papr_rtas_blob_generate() - Construct a new &struct
> > papr_rtas_blob.
> > + * @seq: work function of the caller that is called to obtain
> > + *       data with the caller RTAS call.
> > + *
> > + * The @work callback is invoked until it returns NULL. @seq is
> > + * passed to @work in its first argument on each call. When
> > + * @work returns data, it should store the data length in its
> > + * second argument.
> > + *
> > + * Context: May sleep.
> > + * Return: A completely populated &struct papr_rtas_blob, or NULL
> > on error.
> > + */
> > +static const struct papr_rtas_blob *
> > +papr_rtas_blob_generate(struct papr_rtas_sequence *seq)
> > +{
> > +	struct papr_rtas_blob *blob;
> > +	const char *buf;
> > +	size_t len;
> > +	int err = 0;
> > +
> > +	blob  = kzalloc(sizeof(*blob), GFP_KERNEL_ACCOUNT);
> > +	if (!blob)
> > +		return NULL;
> > +
> > +	if (!seq->work)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +
> > +	while (err == 0 && (buf = seq->work(seq, &len)))
> > +		err = papr_rtas_blob_extend(blob, buf, len);
> > +
> > +	if (err != 0 || !papr_rtas_blob_has_data(blob))
> > +		goto free_blob;
> > +
> > +	return blob;
> > +free_blob:
> > +	papr_rtas_blob_free(blob);
> > +	return NULL;
> > +}
> > +
> > +int papr_rtas_sequence_set_err(struct papr_rtas_sequence *seq, int
> > err)
> > +{
> > +	/* Preserve the first error recorded. */
> > +	if (seq->error == 0)
> > +		seq->error = err;
> > +
> > +	return seq->error;
> > +}
> > +
> > +/*
> > + * Higher-level retrieval code below. These functions use the
> > + * papr_rtas_blob_* and sequence_* APIs defined above to create
> > fd-based
> > + * handles for consumption by user space.
> > + */
> > +
> > +/**
> > + * papr_rtas_run_sequence() - Run a single retrieval sequence.
> > + * @seq:	Functions of the caller to complete the sequence
> > + *
> > + * Context: May sleep. Holds a mutex and an RTAS work area for its
> > + *          duration. Typically performs multiple sleepable slab
> > + *          allocations.
> > + *
> > + * Return: A populated &struct papr_rtas_blob on success. Encoded
> > error
> > + * pointer otherwise.
> > + */
> > +static const struct papr_rtas_blob *papr_rtas_run_sequence(struct
> > papr_rtas_sequence *seq)
> > +{
> > +	const struct papr_rtas_blob *blob;
> > +
> > +	if (seq->begin)
> > +		seq->begin(seq);
> > +
> > +	blob = papr_rtas_blob_generate(seq);
> > +	if (!blob)
> > +		papr_rtas_sequence_set_err(seq, -ENOMEM);
> > +
> > +	if (seq->end)
> > +		seq->end(seq);
> > +
> > +
> > +	if (seq->error) {
> > +		papr_rtas_blob_free(blob);
> > +		return ERR_PTR(seq->error);
> > +	}
> > +
> > +	return blob;
> > +}
> > +
> > +/**
> > + * papr_rtas_retrieve() - Return the data blob that is exposed to
> > + * user space.
> > + * @seq: RTAS call specific functions to be invoked until the
> > + *       sequence is completed.
> > + *
> > + * Run sequences against @param until a blob is successfully
> > + * instantiated, or a hard error is encountered, or a fatal signal
> > is
> > + * pending.
> > + *
> > + * Context: May sleep.
> > + * Return: A fully populated data blob when successful. Encoded
> > error
> > + * pointer otherwise.
> > + */
> > +const struct papr_rtas_blob *papr_rtas_retrieve(struct
> > papr_rtas_sequence *seq)
> > +{
> > +	const struct papr_rtas_blob *blob;
> > +
> > +	/*
> > +	 * EAGAIN means the sequence returns error with a -4 (data
> > +	 * changed and need to start the sequence) status from RTAS
> > calls
> > +	 * and we should attempt a new sequence. PAPR+ (v2.13
> > R1–7.3.20–5
> > +	 * - ibm,get-vpd, R1–7.3.17–6 - ibm,get-indices) indicates that
> > +	 * this should be a transient condition, not something that
> > +	 * happens continuously. But we'll stop trying on a fatal
> > signal.
> > +	 */
> > +	do {
> > +		blob = papr_rtas_run_sequence(seq);
> > +		if (!IS_ERR(blob)) /* Success. */
> > +			break;
> > +		if (PTR_ERR(blob) != -EAGAIN) /* Hard error. */
> > +			break;
> > +		cond_resched();
> > +	} while (!fatal_signal_pending(current));
> > +
> > +	return blob;
> > +}
> > +
> > +/**
> > + * papr_rtas_setup_file_interface - Complete the sequence and
> > obtain
> > + * the data and export to user space with fd-based handles. Then
> > the
> > + * user spave gets the data with read() handle.
> > + * @seq: RTAS call specific functions to get the data.
> > + * @fops: RTAS call specific file operations such as read().
> > + * @name: RTAS call specific char device node.
> > + *
> > + * Return: FD handle for consumption by user space
> > + */
> > +long papr_rtas_setup_file_interface(struct papr_rtas_sequence
> > *seq,
> > +				const struct file_operations *fops,
> > +				char *name)
> > +{
> > +	const struct papr_rtas_blob *blob;
> > +	struct file *file;
> > +	long ret;
> > +	int fd;
> > +
> > +	blob = papr_rtas_retrieve(seq);
> > +	if (IS_ERR(blob))
> > +		return PTR_ERR(blob);
> > +
> > +	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > +	if (fd < 0) {
> > +		ret = fd;
> > +		goto free_blob;
> > +	}
> > +
> > +	file = anon_inode_getfile(name, fops, (void *)blob, O_RDONLY);
> > +	if (IS_ERR(file)) {
> > +		ret = PTR_ERR(file);
> > +		goto put_fd;
> > +	}
> > +
> > +	file->f_mode |= FMODE_LSEEK | FMODE_PREAD;
> > +	fd_install(fd, file);
> > +	return fd;
> > +
> > +put_fd:
> > +	put_unused_fd(fd);
> > +free_blob:
> > +	papr_rtas_blob_free(blob);
> > +	return ret;
> > +}
> > +
> > +/*
> > + * papr_rtas_sequence_should_stop() - Determine whether RTAS
> > retrieval
> > + *                                    sequence should continue.
> > + *
> > + * Examines the sequence error state and outputs of the last call
> > to
> > + * the specific RTAS to determine whether the sequence in progress
> > + * should continue or stop.
> > + *
> > + * Return: True if the sequence has encountered an error or if all
> > data
> > + *         for this sequence has been retrieved. False otherwise.
> > + */
> > +bool papr_rtas_sequence_should_stop(const struct
> > papr_rtas_sequence *seq,
> > +				s32 status, bool init_state)
> > +{
> > +	bool done;
> > +
> > +	if (seq->error)
> > +		return true;
> > +
> > +	switch (status) {
> > +	case RTAS_SEQ_COMPLETE:
> > +		if (init_state)
> > +			done = false; /* Initial state. */
> > +		else
> > +			done = true; /* All data consumed. */
> > +		break;
> > +	case RTAS_SEQ_MORE_DATA:
> > +		done = false; /* More data available. */
> > +		break;
> > +	default:
> > +		done = true; /* Error encountered. */
> > +		break;
> > +	}
> > +
> > +	return done;
> > +}
> > +
> > +/*
> > + * User space read to retrieve data for the corresponding RTAS
> > call.
> > + * papr_rtas_blob is filled with the data using the corresponding
> > RTAS
> > + * call sequence API.
> > + */
> > +ssize_t papr_rtas_common_handle_read(struct file *file,
> > +	       char __user *buf, size_t size, loff_t *off)
> > +{
> > +	const struct papr_rtas_blob *blob = file->private_data;
> > +
> > +	/* bug: we should not instantiate a handle without any data
> > attached. */	if (!papr_rtas_blob_has_data(blob)) {
> Line break is missing here.

Thanks for finding it. I did not find this with checkpatch initially.
Looks like made this mistake in v4 revision.



