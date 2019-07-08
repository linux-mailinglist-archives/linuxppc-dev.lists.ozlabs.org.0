Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5715662B6C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 00:26:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jKmJ4Z5PzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 08:26:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jKkN0wd5zDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 08:24:27 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68MM44X029957
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jul 2019 18:24:23 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tmcm93ub2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 18:24:23 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <zohar@linux.ibm.com>;
 Mon, 8 Jul 2019 23:24:21 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 8 Jul 2019 23:24:18 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68MOGwh62586898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 22:24:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF966A4055;
 Mon,  8 Jul 2019 22:24:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5545FA4051;
 Mon,  8 Jul 2019 22:24:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.110.58])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jul 2019 22:24:15 +0000 (GMT)
Subject: Re: [PATCH v2] tpm: tpm_ibm_vtpm: Fix unallocated banks
From: Mimi Zohar <zohar@linux.ibm.com>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Nayna Jain
 <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Jul 2019 18:24:04 -0400
In-Reply-To: <586c629b6d3c718f0c1585d77fe175fe007b27b1.camel@linux.intel.com>
References: <1562458725-15999-1-git-send-email-nayna@linux.ibm.com>
 <586c629b6d3c718f0c1585d77fe175fe007b27b1.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070822-0020-0000-0000-000003516D0B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070822-0021-0000-0000-000021A5192F
Message-Id: <1562624644.11461.66.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080276
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Huewe <peterhuewe@gmx.de>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jarkko,

On Mon, 2019-07-08 at 18:11 +0300, Jarkko Sakkinen wrote:
> On Sat, 2019-07-06 at 20:18 -0400, Nayna Jain wrote:
> > +/*
> > + * tpm_get_pcr_allocation() - initialize the chip allocated banks for PCRs
> > + * @chip: TPM chip to use.
> > + */
> > +static int tpm_get_pcr_allocation(struct tpm_chip *chip)
> > +{
> > +	int rc;
> > +
> > +	if (chip->flags & TPM_CHIP_FLAG_TPM2)
> > +		rc = tpm2_get_pcr_allocation(chip);
> > +	else
> > +		rc = tpm1_get_pcr_allocation(chip);
> > +
> > +	return rc;
> > +}
> 
> It is just a trivial static function, which means that kdoc comment is
> not required and neither it is useful. Please remove that. I would
> rewrite the function like:
> 
> static int tpm_get_pcr_allocation(struct tpm_chip *chip)
> {
> 	int rc;
> 
> 	rc = (chip->flags & TPM_CHIP_FLAG_TPM2) ?
>      	     tpm2_get_pcr_allocation(chip) :
>      	     tpm1_get_pcr_allocation(chip);

> 
> 	return rc > 0 ? -ENODEV : rc;
> }
> 
> This addresses the issue that Stefan also pointed out. You have to
> deal with the TPM error codes.

Hm, in the past I was told by Christoph not to use the ternary
operator.  Have things changed?  Other than removing the comment, the
only other difference is the return.

Mimi

