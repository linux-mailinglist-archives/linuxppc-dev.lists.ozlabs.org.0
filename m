Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD65B9C3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 15:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSz452CpFz3c7H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 23:45:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QuhoIGmm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QuhoIGmm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSz3P2Jppz2yxX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 23:45:04 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FDCXPQ004631;
	Thu, 15 Sep 2022 13:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=DUiCHVuZrvBO36klH9izOeBWCZAy20AWfKcpBlwGBq4=;
 b=QuhoIGmmHoV2lGJImEHwmkjZ9GI44np1+7KDrkMCUBlOvd4MMv6q4XeACBYf6WGRgDER
 pmk4Vik0HqplwUfyxpirBMgs7ETlWh0pRW4U1gwS8a1X5MPgQcR49TcZ3repD6Pam72c
 YqP+9d3wKRuSAGAGscKMzqZ45ZnXB/QmgJfPnpsdUiNc8cAul8NZtm32xQYqVSyJ8WMp
 LnCZM6I/b4oKRfjJpdxwZe7Fbt6KloUv43wLGFF+V76ZcTPhP02oe+HykT5+0+z1OSjT
 jbAsUCbeJEgk01hg9DuhucxaergMKtWGB8Fha8LUu6NQpKR8U77AHD8NydtWCu3nUvXV AQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jm4qr15cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 13:45:01 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28FDalNr007133;
	Thu, 15 Sep 2022 13:45:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma02dal.us.ibm.com with ESMTP id 3jjy2neg70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 13:45:00 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28FDixjR65143274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 13:44:59 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B92028071;
	Thu, 15 Sep 2022 13:44:59 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2944D28060;
	Thu, 15 Sep 2022 13:44:59 +0000 (GMT)
Received: from localhost (unknown [9.65.104.87])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 13:44:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/pseries: add lparctl driver for
 platform-specific functions
In-Reply-To: <20220914081419.GE28810@kitsune.suse.cz>
References: <20220730000458.130938-1-nathanl@linux.ibm.com>
 <0ead0cd1-f6f6-ecf0-65d9-f3d9366e258c@linux.ibm.com>
 <87k07dl1f6.fsf@linux.ibm.com> <20220913091302.GY28810@kitsune.suse.cz>
 <87v8prtgcj.fsf@linux.ibm.com> <20220913163343.GA28810@kitsune.suse.cz>
 <87sfkvtdfx.fsf@linux.ibm.com> <20220914081419.GE28810@kitsune.suse.cz>
Date: Thu, 15 Sep 2022 08:43:20 -0500
Message-ID: <87leqku51j.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: el257NwRPQ7fxjA3_1kwWFrfGZMoGHpa
X-Proofpoint-ORIG-GUID: el257NwRPQ7fxjA3_1kwWFrfGZMoGHpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_08,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=852 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209150078
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, Chun-Yi <jlee@suse.com>, Lee@kitsune.suse.cz, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Tue, Sep 13, 2022 at 12:02:42PM -0500, Nathan Lynch wrote:
>> Anyway, of course I intend to support the more complex calls, but
>> supporting the simple calls actually unbreaks a lot of stuff.
>
> The thing is that supporting calls that return more than one page of
> data is absolutely required, and this interface built around fixed size
> data transfer can't do it.

Again, it is appropriate for the system parameter commands and handlers
to deal in small fixed size buffers. Code for VPD retrieval will have to
work differently.

> So it sounds like a ticked for redoing the driver right after it's
> implemented, or ending up with two subtly different interfaces - one for
> the calls that can return multiple pages of data, and one for the simple
> calls.
>
> That does not sound like a good idea at all to me.

That's not my plan, and I won't be trying to get anything merged without
supporting some of the more complex cases. OK?
