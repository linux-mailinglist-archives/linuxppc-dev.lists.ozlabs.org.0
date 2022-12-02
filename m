Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0364092E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 16:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNxT30nZQz3bh6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 02:20:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eIZKp8jI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eIZKp8jI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNxS25mmcz3bPR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 02:19:14 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B2FHN4g008585;
	Fri, 2 Dec 2022 15:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=kk2DKWr3NuGpJ+Svcp+qRnmUBH5ye61AWs17cEkLK3k=;
 b=eIZKp8jIvlNGrbtxhT7sBjf8ytCaNuRSPxG1OXnEURIA/3izVTUEdmA34hMqfmrDPOuS
 XEG7huc2qcmbFaV50MRyWiZ6qXLgwCTT869vu14pf3uy+hGWKzcqq68Bfjk29/mRYzfq
 CdthJW71V1Bi5G7B3ndeIxsuU+2KGKVy/JQGknCCNe71yEbF6CWElVHo8Sy14at/5l8d
 pvgQtPbfQMbuyZFtGnTDIW+O+aXVdszLu09dChIWOAhijzoHU1qMO6EcovQ7FEewIy9i
 s6JDbu1/VDnJevH/ezPMo+tbIfiP5r0SZll29mSuKZuWK3lZN6jn75agzhCyy1UYeGAw 2A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m7kvd80wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Dec 2022 15:19:03 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B2F5dmj013584;
	Fri, 2 Dec 2022 15:19:02 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01dal.us.ibm.com with ESMTP id 3m3aeb12x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Dec 2022 15:19:02 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B2FJ05s3408442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Dec 2022 15:19:01 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2E5B5804E;
	Fri,  2 Dec 2022 15:19:00 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C480258052;
	Fri,  2 Dec 2022 15:18:59 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.160.99.100])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Dec 2022 15:18:59 +0000 (GMT)
Message-ID: <e53f14006d4a26f9b8e14d30683e4006ed2fa35f.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Hannes Reinecke <hare@suse.de>, linux-block@vger.kernel.org
Date: Fri, 02 Dec 2022 09:18:59 -0600
In-Reply-To: <4a3b6a0f-be1b-e0b1-941b-6701a42e9a2c@suse.de>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
	 <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
	 <c78edd60-b6ae-6ec0-9ce4-73b9a92b9b32@suse.de>
	 <ed32cbc546383085bc8c00d913a53059831b2cfc.camel@linux.vnet.ibm.com>
	 <4a3b6a0f-be1b-e0b1-941b-6701a42e9a2c@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xZ5pZaCSkGial_cn81MpDjJboOX58ITK
X-Proofpoint-GUID: xZ5pZaCSkGial_cn81MpDjJboOX58ITK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_08,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020114
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-12-02 at 07:56 +0100, Hannes Reinecke wrote:
> On 12/1/22 19:03, Greg Joyce wrote:
> > On Wed, 2022-11-30 at 08:00 +0100, Hannes Reinecke wrote:
> > > On 11/30/22 00:25, gjoyce@linux.vnet.ibm.com wrote:
> > > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > > 
> > > > Extend the SED block driver so it can alternatively
> > > > obtain a key from a sed-opal kernel keyring. The SED
> > > > ioctls will indicate the source of the key, either
> > > > directly in the ioctl data or from the keyring.
> > > > 
> > > > This allows the use of SED commands in scripts such as
> > > > udev scripts so that drives may be automatically unlocked
> > > > as they become available.
> > > > 
> > > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > > Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> > > > ---
> > > >    block/Kconfig                 |   1 +
> > > >    block/sed-opal.c              | 174
> > > > +++++++++++++++++++++++++++++++++-
> > > >    include/linux/sed-opal.h      |   3 +
> > > >    include/uapi/linux/sed-opal.h |   8 +-
> > > >    4 files changed, 183 insertions(+), 3 deletions(-)
> > > >   
> > > > +	ret = opal_get_key(dev, &opal_lrs->session.opal_key);
> > > > +	if (ret)
> > > > +		return ret;
> > > >    	mutex_lock(&dev->dev_lock);
> > > >    	setup_opal_dev(dev);
> > > >    	ret = execute_steps(dev, lr_steps,
> > > > ARRAY_SIZE(lr_steps));
> > > > @@ -2622,6 +2759,14 @@ static int opal_set_new_pw(struct
> > > > opal_dev
> > > > *dev, struct opal_new_pw *opal_pw)
> > > >    	ret = execute_steps(dev, pw_steps,
> > > > ARRAY_SIZE(pw_steps));
> > > >    	mutex_unlock(&dev->dev_lock);
> > > >    
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/* update keyring with new password */
> > > > +	ret = update_sed_opal_key(OPAL_AUTH_KEY,
> > > > +				  opal_pw-
> > > > >new_user_pw.opal_key.key,
> > > > +				  opal_pw-
> > > > > new_user_pw.opal_key.key_len);
> > > > +
> > > >    	return ret;
> > > >    }
> > > >    
> > > What about key revocation?
> > > You only allow to set a new key, but what happens with the old
> > > ones?
> > 
> > My understanding was that key_create_or_update() would not allow
> > duplicates so there shouldn't be old ones. Is that incorrect?
> > 
> Ah, right, you only have one key.
> But still, you might want to revoke that one, too, no?
> (Think of decommissioning old drives ...)
> 
> Cheers,
>  
> Hannes

SED Opal allows for disabling locking on a SED drive. Both sedcli and
sedutil have commands to support this. This is the method for drive
decommisioning (un-provisioning). There is also a mechanism to
cryptographically erase the data on the drive if that is desired.


