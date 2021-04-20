Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 038723661B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:43:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPxxY74jTz30Dr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:42:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XuNGN8gT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XuNGN8gT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPxx62X6cz2y8N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 07:42:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KLYIUk190410; Tue, 20 Apr 2021 17:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=zoeQ6vkUw400/4294RH+pt+SzJY+sKC0woi28HS+zsY=;
 b=XuNGN8gTfvauoLudl0JDCJzffdkChgPMpvEHdz7GQ6nzU9+ZTOgvmZ1v4wi0QqdFlKFd
 ARExKQ6gEu3UzULE3ih87NeDK08TG+XClFPyc2a0qvsHuxXOORVmiyOTQdhFUm1UxLmg
 p36Idjrgr5dKlQ8jpOYUG/3iN5CCYE2tuCCPfUMQETsB7RVq9AHRMnszWj5AkQMKodF/
 qnwqpRym1U4pAYb5sOMMx0vWOUFJF1QJjBXUjZYWpFvHsGOb8UJZRYHmuuf1D7Bv90z7
 gM1K9+DDjc2NngWZe694mxroEd1mi0XnZMeCOOIuviejp2u7FinrHK+EVjiEM4DsO8yn ww== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3824atv4qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 17:42:27 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13KLX1Cr002698;
 Tue, 20 Apr 2021 21:42:26 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 37yqa8wbe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 21:42:26 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13KLgPK719202520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 21:42:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC09E124058;
 Tue, 20 Apr 2021 21:42:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6205C124054;
 Tue, 20 Apr 2021 21:42:25 +0000 (GMT)
Received: from [9.80.196.76] (unknown [9.80.196.76])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 20 Apr 2021 21:42:25 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
From: Lijun Pan <ljp@linux.vnet.ibm.com>
In-Reply-To: <20210420213517.24171-1-drt@linux.ibm.com>
Date: Tue, 20 Apr 2021 16:42:24 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
References: <20210420213517.24171-1-drt@linux.ibm.com>
To: Dany Madden <drt@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qtBITTJRaRjxuCurwKIuGWi6KPggGyxn
X-Proofpoint-ORIG-GUID: qtBITTJRaRjxuCurwKIuGWi6KPggGyxn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_11:2021-04-20,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200150
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
Cc: netdev@vger.kernel.org, Tom Falcon <tlfalcon@linux.ibm.com>,
 paulus@samba.org, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Apr 20, 2021, at 4:35 PM, Dany Madden <drt@linux.ibm.com> wrote:
>=20
> When ibmvnic gets a FATAL error message from the vnicserver, it marks
> the Command Respond Queue (CRQ) inactive and resets the adapter. If =
this
> FATAL reset fails and a transmission timeout reset follows, the CRQ is
> still inactive, ibmvnic's attempt to set link down will also fail. If
> ibmvnic abandons the reset because of this failed set link down and =
this
> is the last reset in the workqueue, then this adapter will be left in =
an
> inoperable state.
>=20
> Instead, make the driver ignore this link down failure and continue to
> free and re-register CRQ so that the adapter has an opportunity to
> recover.

This v2 does not adddress the concerns mentioned in v1.
And I think it is better to exit with error from do_reset, and schedule =
a thorough
do_hard_reset if the the adapter is already in unstable state.

>=20
> Fixes: ed651a10875f ("ibmvnic: Updated reset handling")
> Signed-off-by: Dany Madden <drt@linux.ibm.com>
> Reviewed-by: Rick Lindsley <ricklind@linux.ibm.com>
> Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> ---
> Changes in V2:
> - Update description to clarify background for the patch
> - Include Reviewed-by tags
> ---
> drivers/net/ethernet/ibm/ibmvnic.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c =
b/drivers/net/ethernet/ibm/ibmvnic.c
> index ffb2a91750c7..4bd8c5d1a275 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -1970,8 +1970,10 @@ static int do_reset(struct ibmvnic_adapter =
*adapter,
> 			rtnl_unlock();
> 			rc =3D set_link_state(adapter, =
IBMVNIC_LOGICAL_LNK_DN);
> 			rtnl_lock();
> -			if (rc)
> -				goto out;
> +			if (rc) {
> +				netdev_dbg(netdev,
> +					   "Setting link down failed =
rc=3D%d. Continue anyway\n", rc);
> +			}
>=20
> 			if (adapter->state =3D=3D VNIC_OPEN) {
> 				/* When we dropped rtnl, ibmvnic_open() =
got
> --=20
> 2.26.2
>=20

