Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F251027CADB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:23:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0z894pTBzDqVT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 22:23:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pzTEk7wK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0z2s3SxwzDqLV;
 Tue, 29 Sep 2020 22:19:16 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TC3FHK047398; Tue, 29 Sep 2020 08:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=kEHD+cQpmfemM7C0NRn7bh4gvqCkE44K91jAWZBlJDI=;
 b=pzTEk7wKPvqs6+i9WNtPrTGnqhdZcek5AmOTpVZlgfyND3KJOeoKXCR7D7Cf0R+LuzbW
 xAK3Z8rCWQqFnSDkyG04xtAVJlvHY9GSSs8On5NCs5NzHb32Mjp5upJvYfPLS5yX74c6
 b5aInWb7aTYbv/+2YttH/6VgKTHjEh+6ZlZG9LR4yo5TlHE7LqdzwPytxkV9w8QStYV0
 75bmSv/MIdvscxmj2epHzHFiElpAZrdPDH3mnDjQKpvA/KYFMinJMmQ/ZC3vJiADUIPO
 uVDc2uSAe22ieY28mdQlpl9VBuObNJIryjwuTgM0lo22IeT4SfkCRIpG1aTISbljWIH9 vA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33v4h78na6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 08:19:13 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08TCD9NT025548;
 Tue, 29 Sep 2020 12:19:11 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 33sw981q00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 12:19:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08TCJ8LH28377456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 12:19:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 866A3A4051;
 Tue, 29 Sep 2020 12:19:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E130A404D;
 Tue, 29 Sep 2020 12:19:07 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.84.239])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Sep 2020 12:19:07 +0000 (GMT)
Message-ID: <1f0be5fa1c261180399b87495f175856af2de209.camel@linux.ibm.com>
Subject: Re: [PATCH] linux: configure CONFIG_I2C_OPAL as in-built.
From: Mimi Zohar <zohar@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 29 Sep 2020 08:19:06 -0400
In-Reply-To: <CACPK8XdeAzbXcm2w6kJuAQzckdyFQ2P9h+fC36ZArpkubqC1mg@mail.gmail.com>
References: <1600885506-18734-1-git-send-email-nayna@linux.ibm.com>
 <8dc1ad002dcdc02122725dcc3ba27e1fd8c78b78.camel@linux.ibm.com>
 <CACPK8XdeAzbXcm2w6kJuAQzckdyFQ2P9h+fC36ZArpkubqC1mg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_03:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009290108
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
Cc: openpower-firmware@lists.ozlabs.org, Nayna Jain <nayna@linux.ibm.com>,
 klaus@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joel,

On Tue, 2020-09-29 at 06:14 +0000, Joel Stanley wrote:
> On Fri, 25 Sep 2020 at 18:19, Mimi Zohar <zohar@linux.ibm.com> wrote:
> >
> > Hi Nayna,
> >
> > On Wed, 2020-09-23 at 14:25 -0400, Nayna Jain wrote:
> > > Currently, skiroot_defconfig CONFIG_I2C_OPAL is built as a loadable
> > > module rather than builtin, even if CONFIG_I2C=y is defined. This
> > > results in a delay in the TPM initialization, causing IMA to go into
> > > TPM bypass mode. As a result, the IMA measurements are added to the
> > > measurement list, but do not extend the TPM. Because of this, it is
> > > impossible to verify or attest to the system's integrity, either from
> > > skiroot or the target Host OS.
> >
> > The patch description is good, but perhaps we could provide a bit more
> > context before.
> >
> > The concept of trusted boot requires the measurement to be added to the
> > measurement list and extend the TPM, prior to allowing access to the
> > file. By allowing access to a file before its measurement is included
> > in the measurement list and extended into the TPM PCR, a malicious file
> > could potentially prevent its own measurement from being added. As the
> > PCRs are tamper proof, measuring and extending the TPM prior to giving
> > access to the file, guarantees that all file measurements are included
> > in the measurement list, including the malicious file.
> >
> > IMA needs to be enabled before any files are accessed in order to
> > verify a file's integrity and extend the TPM with the file
> > measurement.  Queueing file measurements breaks the measure and extend,
> > before usage, trusted boot paradigm.
> >
> > The ima-evm-utils package includes a test for walking the IMA
> > measurement list, calculating the expected TPM PCRs, and comparing the
> > calculated PCR values with the physical TPM.  Testing is important to
> > ensure the TPM is initialized prior to IMA.  Failure to validate the
> > IMA measurement list may indicate IMA went into TPM bypass mode, like
> > in this case.
> 
> Thanks for the explanation Mimi. It's lucky that the TPM drivers can
> be loaded early enough!
> 
> Should we add something like this to security/integrity/ima/Kconfig?
> 
> select I2C_OPAL if PPC_POWERNV
> 
> It's generally frowned upon to select user visible symbols, but IMA
> does this for the TCG options already.

The other examples enable the TPM.  I2C_OPAL is dependent on I2C being
builtin.  I'm not sure if this select is complete, nor if this is where
it belongs.

Mimi

