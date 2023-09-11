Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E43479A2D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 07:31:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pSA9Hybv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkb1G0dV8z3c57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 15:31:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pSA9Hybv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkb0N4jFVz30fk;
	Mon, 11 Sep 2023 15:30:43 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B58sex019506;
	Mon, 11 Sep 2023 05:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=/apmyYlDFcp9QzOO9NRRrWiQUrCwuIqBtIy16R70c2Q=;
 b=pSA9Hybv0ds0WHG7vHLjn3wr3Lo3fS/yukiH9uGUS5LRc00oWlXQnEhDjr8LcXWnFyJ5
 sHvmHUw+4sSruSi2sBEfdtsDa7n+wCFh1GzXArBhPNjRCrprPhsYuanXsl59VGybkuKm
 hs359vTkj4ku5vLURSp/LnUkdKUYiDnt5Lf/XUQW8ryB0mY7CHSlX8gIeIdzIeD5WJNj
 bjH2da7T5lOpLgjt1oYaFhn+B5Gg9lC3hmgkezZI1J1GgpajI+AteB7T21GEsoNyJNaQ
 NXAVoaC0J+bNT92VoL77Y3OiVSox5TTZ2FGhG5n4ZCNugITdm/TUMCzN0OQO8KGIXNiS JA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t1m3p8jpu-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:30:37 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38B3qOZu024103;
	Mon, 11 Sep 2023 05:01:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t131sr9ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:01:47 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38B51iCo44040736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Sep 2023 05:01:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B32FB20043;
	Mon, 11 Sep 2023 05:01:44 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1459220040;
	Mon, 11 Sep 2023 05:01:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.122.71])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 11 Sep 2023 05:01:42 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V5 3/3] skiboot: Update IMC PMU node names for power10
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <f45ca55e-7d63-451a-9763-d3a6b8196179@arbab-laptop>
Date: Mon, 11 Sep 2023 10:31:31 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B2C376F-4326-4C79-9EEA-FD1EC2E677FC@linux.vnet.ibm.com>
References: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
 <20230717032431.33778-3-atrajeev@linux.vnet.ibm.com>
 <f45ca55e-7d63-451a-9763-d3a6b8196179@arbab-laptop>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AXw5x_VqzSfQgLQ0MVDjax1DmsAabdra
X-Proofpoint-GUID: AXw5x_VqzSfQgLQ0MVDjax1DmsAabdra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110046
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, skiboot@lists.ozlabs.org, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 10-Aug-2023, at 3:28 AM, Reza Arbab <arbab@linux.ibm.com> wrote:
>=20
> On Mon, Jul 17, 2023 at 08:54:31AM +0530, Athira Rajeev wrote:
>> @@ -408,14 +469,129 @@ static void disable_unavailable_units(struct =
dt_node *dev)
>> avl_vec =3D (0xffULL) << 56;
>> }
>>=20
>> - for (i =3D 0; i < ARRAY_SIZE(nest_pmus); i++) {
>> - if (!(PPC_BITMASK(i, i) & avl_vec)) {
>> - /* Check if the device node exists */
>> - target =3D dt_find_by_name_before_addr(dev, nest_pmus[i]);
>> - if (!target)
>> - continue;
>> - /* Remove the device node */
>> - dt_free(target);
>> + if (proc_gen =3D=3D proc_gen_p9) {
>> + for (i =3D 0; i < ARRAY_SIZE(nest_pmus_p9); i++) {
>> + if (!(PPC_BITMASK(i, i) & avl_vec)) {
>=20
> I think all these PPC_BITMASK(i, i) can be changed to PPC_BIT(i).

Hi Reza,

Thanks for reviewing the changes.
Yes. I will add the change in next version

Thanks
Athira
>=20
>> + /* Check if the device node exists */
>> + target =3D dt_find_by_name_before_addr(dev, nest_pmus_p9[i]);
>> + if (!target)
>> + continue;
>> + /* Remove the device node */
>> + dt_free(target);
>> + }
>> + }
>> + } else if (proc_gen =3D=3D proc_gen_p10) {
>> + int val;
>> + char name[8];
>> +
>> + for (i =3D 0; i < 11; i++) {
>> + if (!(PPC_BITMASK(i, i) & avl_vec)) {
>> + /* Check if the device node exists */
>> + target =3D dt_find_by_name_before_addr(dev, nest_pmus_p10[i]);
>> + if (!target)
>> + continue;
>> + /* Remove the device node */
>> + dt_free(target);
>> + }
>> + }
>> +
>> + for (i =3D 35; i < 41; i++) {
>> + if (!(PPC_BITMASK(i, i) & avl_vec)) {
>> + /* Check if the device node exists for phb */
>> + for (j =3D 0; j < 3; j++) {
>> + snprintf(name, sizeof(name), "phb%d_%d", (i-35), j);
>> + target =3D dt_find_by_name_before_addr(dev, name);
>> + if (!target)
>> + continue;
>> + /* Remove the device node */
>> + dt_free(target);
>> + }
>> + }
>> + }
>> +
>> + for (i =3D 41; i < 58; i++) {
>> + if (!(PPC_BITMASK(i, i) & avl_vec)) {
>> + /* Check if the device node exists */
>> + target =3D dt_find_by_name_before_addr(dev, nest_pmus_p10[i]);
>> + if (!target)
>> + continue;
>> + /* Remove the device node */
>> + dt_free(target);
>> + }
>> + }
>=20
> --=20
> Reza Arbab

