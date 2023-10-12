Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD87C71D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 17:49:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FmmjQA9Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5vFV1lHtz3vYJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 02:49:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FmmjQA9Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5vDZ51STz3cRJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 02:48:14 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CFlDki016590;
	Thu, 12 Oct 2023 15:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=U5ir2vs0drNHQeLDviI0cv61McQFqlJaNnUqsSxMXaw=;
 b=FmmjQA9YVW3cuNeYJJK7fVYY1evtryu2+lFSn9Ufyzg0RltI7YetGovvbJmeG0zU2ZIB
 3BXJFLATMXk+UBRBPCP1Hk/ZYv+zVS5b4uY/DZ/0aFHZY0F9MdoJ/QHfICIJ1HP645Mz
 cghydCkQm1NZsoP/RDxyjXPY1bmnKPnvLxFKDqbsfgl38ePl950iB3P2ZLkxs6pct4e4
 oDPfOUg/0AXAB/Axtqtw9Ww+O4Uvo+wKZHUwHw84bICI9INOeweKLSXHP4sBw/ULGd2Q
 ZfXdxluxu7QCh5XY92M0vxCQ/eFeVjFm7rqQqQcxnHDuNy/ur/Ikz/CUVhiD7ClFf+6R fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpkrdg12f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 15:47:46 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39CFlKtr017185;
	Thu, 12 Oct 2023 15:47:46 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpkrdg121-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 15:47:46 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39CDtcAG023000;
	Thu, 12 Oct 2023 15:47:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc1yxv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 15:47:45 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39CFlgC745023956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 15:47:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9847920043;
	Thu, 12 Oct 2023 15:47:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B530E20040;
	Thu, 12 Oct 2023 15:47:40 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.59.173])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Oct 2023 15:47:40 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <5d79ca77e4ca4f6c895e26384655563f@AcuMS.aculab.com>
Date: Thu, 12 Oct 2023 21:17:28 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <F265857D-0D37-4878-908C-D20732F212F9@linux.vnet.ibm.com>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <3b7b34e74bdb4b05b6b21edd81af59d0@AcuMS.aculab.com>
 <5d79ca77e4ca4f6c895e26384655563f@AcuMS.aculab.com>
To: David Laight <David.Laight@ACULAB.COM>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RovymA2gl0qwa6nsdBmdBMZBHkRN0SfY
X-Proofpoint-ORIG-GUID: Kqf1swBl_Rra9hI05bdZ2RsP5yJPI95P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120131
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
Cc: "irogers@google.com" <irogers@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "acme@kernel.org" <acme@kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Oct-2023, at 9:15 PM, David Laight <David.Laight@ACULAB.COM> =
wrote:
>=20
> From: David Laight
>> Sent: 05 October 2023 11:16
> ...
>>> - cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name =
cpu* -print -quit)
>>> + cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name =
'cpu*' -print -quit)
>>=20
>> Isn't the intention to get the shell to expand "cpu* ?
>> So quoting it completely breaks the script.
>=20
> Complete brain-fade :-(

Hi David,

Yeah, quoting it also will expand

Thanks
Athira
>=20
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, =
MK1 1PT, UK
> Registration No: 1397386 (Wales)
>=20

