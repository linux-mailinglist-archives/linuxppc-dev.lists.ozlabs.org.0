Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56363F423
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 16:37:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNKv40V4gz3bcf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 02:37:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G9bLF70K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G9bLF70K;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNKt211RKz3bY1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 02:36:09 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1FOf0M013550;
	Thu, 1 Dec 2022 15:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=Xk/l0U+Cz7PYE5CVeOcthMKdyGJyTMeO5xaBAtu53ps=;
 b=G9bLF70KykG6TWmEzNzjyCBteyzp0RxfqDaqnZ6XSjHmqgQxXRg2DOwQjNcKtmxy2VMl
 iMjwSRJ1NVgnWCt4vLTrPOVLoITg2qWeqe3EjxD/R6vCXtYH0nrwEitQRu/gPq6kthfD
 LT3MymtQqzy+xnXtZB1fvAw1GcmImVtrRKbJ8mmfCycuuB06FkGvAsBhOQFiJQauOPZ8
 TX6OaflzchNzwQLdjlUvTavVI+wS7PgS2icIG70ws/i/Ke3Y9u2qTVKNEdnn6d81kVRj
 xHGjlSqFTIhLyyS/xtwUnCQYIBeVup+MbpRL+nuHHCwO1l9xU6/5NIZxCYICZdf+c5YL og== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6xvs0bgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 15:35:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B1FLlJ4018218;
	Thu, 1 Dec 2022 15:30:54 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01dal.us.ibm.com with ESMTP id 3m3aeanw4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 15:30:54 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B1FTcEa18940552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Dec 2022 15:29:38 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BDDB5805A;
	Thu,  1 Dec 2022 15:29:38 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFF7C5805D;
	Thu,  1 Dec 2022 15:29:36 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.160.99.100])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Dec 2022 15:29:36 +0000 (GMT)
Message-ID: <044c90dc7feb3959b5740154addc230ba9a57216.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Ben Boeckel <me@benboeckel.net>
Date: Thu, 01 Dec 2022 09:29:36 -0600
In-Reply-To: <Y4gjgf2xHOYTVnSc@farprobe>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
	 <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
	 <c78edd60-b6ae-6ec0-9ce4-73b9a92b9b32@suse.de>
	 <2133c00e5e7c53c458dbb709204c955bac8bee88.camel@linux.vnet.ibm.com>
	 <Y4gjgf2xHOYTVnSc@farprobe>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RN6-zXpnA45xPOTAP4vXVTMBnrGVxftM
X-Proofpoint-GUID: RN6-zXpnA45xPOTAP4vXVTMBnrGVxftM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_11,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010113
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
Reply-To: gjoyce@linux.vnet.ibm.com
Cc: axboe@kernel.dk, nayna@linux.ibm.com, linux-block@vger.kernel.org, keyrings@vger.kernel.org, Hannes Reinecke <hare@suse.de>, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-30 at 22:46 -0500, Ben Boeckel wrote:
> On Wed, Nov 30, 2022 at 09:19:25 -0600, Greg Joyce wrote:
> > On Wed, 2022-11-30 at 08:00 +0100, Hannes Reinecke wrote:
> > > On 11/30/22 00:25, gjoyce@linux.vnet.ibm.com wrote:
> > > > +	case OPAL_KEYRING:
> > > > +		/* the key is in the keyring */
> > > > +		ret = read_sed_opal_key(OPAL_AUTH_KEY, key-
> > > > >key,
> > > > OPAL_KEY_MAX);
> > > > +		if (ret > 0) {
> > > > +			if (ret > 255) {
> > > 
> > > Why is a key longer than 255 an error?
> > > If this is a requirement, why not move the check into
> > > read_sed_opal_key() such that one only has to check for
> > > ret < 0 on errors?
> > 
> > The check is done here because the SED Opal spec stipulates 255 as
> > the
> > maximum key length. The key length (key->key_len) in the existing
> > data
> > structures is __u8, so a length greater than 255 can not be
> > conveyed.
> > For defensive purposes, I though it best to check here.
> 
> Perhaps naming it `OPAL_MAX_KEY_LEN` would help clarify this?
> 
> --Ben

I'm not averse to changing it because it would be clearer. My concern
is that it's been OPAL_KEY_MAX for 5+ years (the original SED Opal
commit). Unless there is strong consensus to change it, I'm going to
leave it as the original name.

-Greg

