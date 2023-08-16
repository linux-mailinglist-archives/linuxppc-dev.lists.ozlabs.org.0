Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA677E9E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 21:46:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BEnU/VM/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQzDK2ZMZz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BEnU/VM/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQzCN1G20z2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 05:46:07 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GJcJMA002225;
	Wed, 16 Aug 2023 19:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=hBBNENKxEqj7kT9AWimxqHg0F8y2eG57NgzFKLZvEq8=;
 b=BEnU/VM/IxoQrcs8N/gkFdfQSivK/gQtYePhH+ukeJUnhr155tCy8KHTroDVPm28SjjX
 98N8shN3yEsZvRCwBWSOA5ZDfEHIfYzVCbnKSeMV5PvHyCJw5mUKNXB2dpYZgpHutyZO
 Z+cmo7yWk+qsif/ayp0CCljDtUzQJtryMmwHITxytCw3VGkH0GM51b1CcbJe/QbZBZCK
 dakKpUVH1B7A9kn6tdTLbdBm0HNkkatbRVxJj2ddbifCSGdCVU3jV/cJC/7ZfUtsGMaD
 CmxNRAgam/TmSDOtbWHeYj15TnB6pxbU/u4b70fLUO8+jzf2KCpAEveW9LblNz7eMxtj nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sh4pbrbpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 19:45:50 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37GJcPLT002972;
	Wed, 16 Aug 2023 19:45:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sh4pbrbpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 19:45:49 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GJKOJM007856;
	Wed, 16 Aug 2023 19:45:48 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3senwkfpma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 19:45:48 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GJjlde7602808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 19:45:47 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 698D25805C;
	Wed, 16 Aug 2023 19:45:47 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86DC65805E;
	Wed, 16 Aug 2023 19:45:46 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.60.97])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Aug 2023 19:45:46 +0000 (GMT)
Message-ID: <46cda90a12da4639d1e65ce82ae342df05b7afc2.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/3 RESEND] sed-opal: keyrings, discovery, revert,
 key store
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: linux-block@vger.kernel.org
Date: Wed, 16 Aug 2023 14:45:46 -0500
In-Reply-To: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
References: <20230721211534.3437070-1-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gv8S02VnGEarXaN7umjt4jkoFW7jziU1
X-Proofpoint-ORIG-GUID: QeHwhJfdE2e3SCjhvbRRswF3o-uLsE18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_18,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=844 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308160173
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, okozina@redhat.com, dkeefe@redhat.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's been almost 4 weeks since the last resend and there haven't been
any comments. Is there anything that needs to be changed for
acceptance?

Thanks for your input.

Greg

On Fri, 2023-07-21 at 16:15 -0500, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> This patchset has gone through numerous rounds of review and
> all comments/suggetions have been addressed. The reviews have
> covered all relevant areas including reviews by block and keyring
> developers as well as the SED Opal maintainer. The last
> patchset submission has not solicited any responses in the
> six weeks since it was last distributed. The changes are
> generally useful and ready for inclusion.
> 
> TCG SED Opal is a specification from The Trusted Computing Group
> that allows self encrypting storage devices (SED) to be locked at
> power on and require an authentication key to unlock the drive.
> 
> The current SED Opal implementation in the block driver
> requires that authentication keys be provided in an ioctl
> so that they can be presented to the underlying SED
> capable drive. Currently, the key is typically entered by
> a user with an application like sedutil or sedcli. While
> this process works, it does not lend itself to automation
> like unlock by a udev rule.
> 
> The SED block driver has been extended so it can alternatively
> obtain a key from a sed-opal kernel keyring. The SED ioctls
> will indicate the source of the key, either directly in the
> ioctl data or from the keyring.
> 
> Two new SED ioctls have also been added. These are:
>   1) IOC_OPAL_REVERT_LSP to revert LSP state
>   2) IOC_OPAL_DISCOVERY to discover drive capabilities/state
> 
> change log v5:
>         - rebase to for-6.5/block
> 
> change log v4:
>         - rebase to 6.3-rc7
>         - replaced "255" magic number with U8_MAX
> 
> change log:
>         - rebase to 6.x
>         - added latest reviews
>         - removed platform functions for persistent key storage
>         - replaced key update logic with key_create_or_update()
>         - minor bracing and padding changes
>         - add error returns
>         - opal_key structure is application provided but kernel
>           verified
>         - added brief description of TCG SED Opal
> 
> 
> Greg Joyce (3):
>   block: sed-opal: Implement IOC_OPAL_DISCOVERY
>   block: sed-opal: Implement IOC_OPAL_REVERT_LSP
>   block: sed-opal: keyring support for SED keys
> 
>  block/Kconfig                 |   2 +
>  block/opal_proto.h            |   4 +
>  block/sed-opal.c              | 252
> +++++++++++++++++++++++++++++++++-
>  include/linux/sed-opal.h      |   5 +
>  include/uapi/linux/sed-opal.h |  25 +++-
>  5 files changed, 282 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 1341c7d2ccf42ed91aea80b8579d35bc1ea381e2

