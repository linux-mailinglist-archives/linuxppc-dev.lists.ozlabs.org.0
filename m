Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62A592717
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5ZvC4B5vz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 10:30:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UaN5KwWx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UaN5KwWx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5ZtS6Qk0z2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 10:30:08 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27F0DqG7013919
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 00:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=CFYI9wIRCGY5XJqrgy6PLIa1e0ynRlxo1558efNmkpI=;
 b=UaN5KwWxolMnZ9ZjwLKehL8MiLRiEEvgwKlLbDGf4z4/SYP18fULRtMisA30iPloAaZ5
 PuU8KIkSsXT8oI4emn1EfEnOEs3smE8QSmnm9NMrTVcIIxxCU9qO7D0FedLNAq54YnVp
 lfCSW0ML3Z/JZHu/DY9+RyVt8RZIxfe4WVZrMozprm/hG4lsg/6wTpOiZdYbcwLQUkNt
 bDNSmnHkZYJycNHphOYhHC066J2ISH9e9h6W5PL2jhe0ZBAiV2yWw1YM7E0h9BbV/0jN
 EoQQm3j0WFS7yVwmgKVN2fwsttJED+8K/D1XhdusAUPkxIL2sNcY/55WBfigcgwx5sNn YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hybdrr8m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 00:30:04 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27F0U45t006539
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 00:30:04 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hybdrr8k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Aug 2022 00:30:04 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27F0M4OF027326;
	Mon, 15 Aug 2022 00:30:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 3hx3k913br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Aug 2022 00:30:02 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27F0U0mw34079182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Aug 2022 00:30:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F14F2A404D;
	Mon, 15 Aug 2022 00:29:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AE1DA4040;
	Mon, 15 Aug 2022 00:29:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 15 Aug 2022 00:29:59 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4A369600EE;
	Mon, 15 Aug 2022 10:29:53 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <462e3fe47fbd4a6d63c568572342bf14fa010e2c.camel@linux.ibm.com>
Date: Mon, 15 Aug 2022 10:29:53 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <B270D868-89D7-4713-A387-6AB662BE564D@linux.ibm.com>
References: <20220725063111.120926-1-rmclure@linux.ibm.com>
 <462e3fe47fbd4a6d63c568572342bf14fa010e2c.camel@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ToyQULjewiiUmqLMrr3DMPPcz8aeVCEK
X-Proofpoint-ORIG-GUID: VSpFxmQPZhKSB_j_SFwv5Opw_njYmRqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-14_15,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=700 priorityscore=1501 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208140103
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 11 Aug 2022, at 8:11 pm, Andrew Donnellan <ajd@linux.ibm.com> =
wrote:
>=20
> On Mon, 2022-07-25 at 16:31 +1000, Rohan McLure wrote:
>> Clear user state in gprs (assign to zero) to reduce the influence of
>> user
>> registers on speculation within kernel syscall handlers. Clears occur
>> at the very beginning of the sc and scv 0 interrupt handlers, with
>> restores occurring following the execution of the syscall handler.
>>=20
>> One function of syscall_exit_prepare is to determine when non-
>> volatile
>> regs must be restored, and it still serves that purpose on 32-bit.
>> Use
>> it now for determining where to find XER, CTR, CR.
>=20
> I'm not sure exactly how syscall_exit_prepare comes into this?

Apologies, this comment belongs in patch 14 and concerns =
interrupt_exit_user_prepare.=
