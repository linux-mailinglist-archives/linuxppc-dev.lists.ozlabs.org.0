Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FBF578E2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 01:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmyWv0Blcz3c1T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 09:16:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lRunpF4H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lRunpF4H;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmxVm3cnVz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 08:30:23 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IMNfoV028400;
	Mon, 18 Jul 2022 22:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pp1; bh=od4oqUjsiZSp13/7LnxjXVjFWDBaTzxxtRazIN1+4Sk=;
 b=lRunpF4HGAcGh7R+9veGgF3mxZs2O+OFfOp4jz7Eazkka/Ftrqy2/sZCcaDiYXBslpn7
 VNjfsXJnQOI2gGxullOIbbBNsX8tMMG+WaHRjVAmzVdQ4mXq80s/2lupYdiHTi3+Ag57
 gatTCF6IelG2yESUE8LvGSUoEECyC9MoHGoL4b92dAmaRjVb4A7lNv6h8t9t6WlvPZpX
 3q2FjFLzRul+OJrak8Y1R3qjiA2VbKqtK7VjeOwTMtvFDmps9vCN3IpwaM8k7znL7Qog
 V0aypnvNs+kC36AtqHgRVd2mgKCrimdtVEOCNqePr6JjabbrlC+yeMWmW+kRj7rVGYZK rA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdg9482rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Jul 2022 22:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcsxjdWlTqPgzdn/xdVJ7n+gu8xn4kK7ldt6JNCouO5OxNda8cNG01kA+v88dZICsLRJ/e+TwByvKKlAwNXsSDT9IQMQjRZioNyBZ4J2C/l4IrS6E6m/2Yxe5zic8T0pd1JSBM2wGPzpt6fEeK93w1tmO1N4bm6OJbvBpAyrcfnSfWM2tnAVQp9rorRxahAmGVuYsoV6Z+sL921e4tdqx9gU1F6drOIFRBxtp4hTJ6/PLuibQO6RuPIVoU2jGtNLA8XZYbJ1SOnjyleGCi04DXeYn1HqDCjtmieub5xXfBUfHqDQ7JAdkd8e9It4G0avrSthHQbw0sgOIscYlYxsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=od4oqUjsiZSp13/7LnxjXVjFWDBaTzxxtRazIN1+4Sk=;
 b=GyXT5mE8PGGW8S9MQ/2GpPyBdaIp3GH2yCOduRpCAwuZKaQ9Lx5XuDkL1u2e+VjloKzIVBOqn/i6OZ37IAHvIoequXC0j8537l5kuDtfrsKUbM7VuwfJvzDfwfxSEXdFWT/gytiR8qBwpsteXg+/xMB/uaApLUuW9Id+KODNsng4a+9XlWDCSZXnIOTu3zLmlRhA5S4CE1fDNyuX4FXwN+nZt709NNci8Ciz/GQcJqhi17ovzXD0liCrjoTcS2JdstpM9B+Ay3leqS+nmToyTMb6sjRbWEMzx5aU6Ix3IdhkhE2h02fTG00t/hHGc3WoB7LMr0Opxb5H3Fz+Sva5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from DM6PR15MB2810.namprd15.prod.outlook.com (2603:10b6:5:1a6::31)
 by BN6PR15MB1459.namprd15.prod.outlook.com (2603:10b6:404:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 22:30:13 +0000
Received: from DM6PR15MB2810.namprd15.prod.outlook.com
 ([fe80::8d02:1472:f4be:5ddf]) by DM6PR15MB2810.namprd15.prod.outlook.com
 ([fe80::8d02:1472:f4be:5ddf%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 22:30:13 +0000
From: Gregory Joyce <gjoyce@ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore
Thread-Topic: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore
Thread-Index: AQHYllPknLKZFnQ9pEGE8ifi5curJ62EuZra
Date: Mon, 18 Jul 2022 22:30:13 +0000
Message-ID:  <DM6PR15MB2810CE8DAEDDEC50D005C058CE8C9@DM6PR15MB2810.namprd15.prod.outlook.com>
References: <20220713005947.459967-1-nayna@linux.ibm.com>
 <20220713005947.459967-2-nayna@linux.ibm.com>
In-Reply-To: <20220713005947.459967-2-nayna@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85eb4b78-b0c3-4c2f-2d11-08da690d14e2
x-ms-traffictypediagnostic: BN6PR15MB1459:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /2HkEzx3+Hgzz9mEPJkJL24/w5NkVgiJPw/4JH9XczgS/20sBl7YNBm3VOka6OdBdZWuEpEij9ieVwDu0aegBhIAR/KBDEZkisO7dNeF+WaU9e+GE9FIN3Tn2Wv8R1XQoTHw7dP9Znd0mQK22k8ajCDXBGdjwmjVmh/3wWxQ/GK+3L2IqiaN+vOk+sz5NiYikPTw68sQ1ggDQotVaIN6z1wQO06qWkcVx10YqNwFdaeczVjOE7NP6zgfAa7gCex1dJVLtoJou/tLC5L/SNRa8Uj62gQE6a/LDSHi4viJ5McwNGX8U8PgIuTwCSqJSpCt+eRVhhF9CX0YEOZYpwWlp17qv3WffW+VZ2uNx0h5G6qqEPeLVaCd0MpXlN0tzeXxQbjpmsUYv8wbDWf6oN98i8R3Qypva18s0bYH3yf7aereCiJoiLKlKC7NdY9hKMjwdKLUdRjmUGxot1tZdo/JZJ6cXKmdMfx3R5YzRQbhFXVNBaXRvY+1kzR2p6j/87J0ZkYykfYFjV8cbVZpMxhrqMKUqb+QlNeFMVKM37s22wEU071NrcmMjUc9+U60s2Ny98SIORwM4adYWJn6+w5RCeJO934tgoIVa97g2dRPvriZdmrNZGTHhxikN9qTV/vm7rIYplHPT89fLa/6JyYFvpd0HT/NtclSL2nTVs1Pe4Z0QkKUFEbknCsDuMIJr91hDWTsdg2fUdvlFXO1FxjUqecB2R/+5QK9jCvddMI9WPC+fb6RfT6feKXEXAb8O7ibNNyAyI/gyhqvOqR4Q54SWTXjoXtAWDPtqnPR9b/VGIwjtGdAujvhSEQz6G2k+9GC
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR15MB2810.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(396003)(366004)(376002)(136003)(41300700001)(122000001)(9686003)(6506007)(7696005)(2906002)(53546011)(38100700002)(83380400001)(5660300002)(186003)(55016003)(33656002)(71200400001)(66946007)(66476007)(64756008)(54906003)(316002)(66556008)(8936002)(110136005)(478600001)(52536014)(4326008)(86362001)(8676002)(76116006)(91956017)(66446008)(19627405001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?eIcZCB5WNtzIMUBaprfXDQ16i6YMKj/rqXZU2Yodz+xW3PzPRYAbHSWz1d?=
 =?iso-8859-1?Q?BOrN05fV2cozyV9VZ09wsMGGC9L+r1wH69R3m9vTfcWFjtITHN5yNghIZt?=
 =?iso-8859-1?Q?KaWGuUwdo8csAFnWk61hO1jGacrtJ0k7MbU0Z2dBNojnkanylyZUxSI27P?=
 =?iso-8859-1?Q?CBSp7rTnncAgjwa2BdkcT/FCrzmiCIwBwtgjnNNIO8yTPtiCfD72izDrMO?=
 =?iso-8859-1?Q?gBKykyHOdHvgA9U3YyQ7RB/160lG8MxPvWG83lD/dMNuZnqcTx7jt/qxb/?=
 =?iso-8859-1?Q?fo4W8A8o6rJ8l1FMZmfh3yAd0kZuRUIl8YfQnDpkfL6DPE0BjRwtUpnTiP?=
 =?iso-8859-1?Q?9ouFVimcZ1GmKV6XN98FWhVM8RNjjf2/GvCdpP9WCCinbSUSuqiN4z6X9t?=
 =?iso-8859-1?Q?ROo85R8j1dqIcYtN/hdhP3Y4673HnAhqE+Y70pSKoXd/XrCqp0+PNxwkca?=
 =?iso-8859-1?Q?BMCJ7bEdjvNfpvBiG3lk9fflrwg+paXPP9Q5mghrIOYljdQEkbGCxyPInj?=
 =?iso-8859-1?Q?gG+52nq2NSgLZ2Mf173KBkG734xF1zH7ilyuZ15CIsSyWcxhIG7Z1bwv7i?=
 =?iso-8859-1?Q?qPKnRQTmZJYukH0Iyz4u7KvY1dO2c+XVSxFOHj3qbWW3X2nIP26Ho/5lxl?=
 =?iso-8859-1?Q?bVEYKY0U1cZagqZwnCL8etAET8Y9IUDpNHTjMs1l3V35/TWH3Uyg4GG7Hx?=
 =?iso-8859-1?Q?MObnh8MwBEfse8POL1hpAc38fUI1O/psJINAd6jgh4QmjkJJw3qcpheR9Y?=
 =?iso-8859-1?Q?jRvuV2j5il9ltGNoz5Nz3JO/XuEj3S1vpct3pC2ArxXcA/Uv/6NTbT3MLR?=
 =?iso-8859-1?Q?wOPATQvE21bvYEmaJiVk+ceDbsnIsXbE6w0ru868CbYXqtyXcgPjtSP5Zh?=
 =?iso-8859-1?Q?i00IuVexL5cZ7D3SlbNhtzej6++e7mHV8CL+scA4H3eWjJS3YuRa9S5ThH?=
 =?iso-8859-1?Q?PtpWRfU0LlCCR0vcHC6ED91HKaqnGhuDSkOG7Ca/fj2FFPDsRpUiLM3G3t?=
 =?iso-8859-1?Q?eQ++operXpT8qI1TdOqrqglgQEZIqTneCnw96Gu8GL0TcJFf2hNNqcPukW?=
 =?iso-8859-1?Q?GluxbyfjhIbq23KB5LBaRUqfZtdb9yoHXa6scPIOHAMda1xWvxC9qVzJGh?=
 =?iso-8859-1?Q?OcOvDBdl05aIPIO+cdc+lF1hFFHPIGO3P7318at+x81NTFsz00UTLx9CQx?=
 =?iso-8859-1?Q?aleHxBj6T3gz15ZHXPPleIVywhTc7fTnB8jpWLlOLf9THYKbcG/bNr66Gt?=
 =?iso-8859-1?Q?0zrZsuEmkBkccVSTgMfm2JXtC7OMmPixfew0laWlEY20EA75kSEJQQstRT?=
 =?iso-8859-1?Q?TnOVnjzfEgowKOQYDT2n4MiIROwjQQn615Y+QRKe01nJra+GPbDJ7FGbA7?=
 =?iso-8859-1?Q?3VWqq+j7Qu1nlcXkceoFXe5Au412CdU2HetfI2pZm5RR6YVg+bPFm0PfPU?=
 =?iso-8859-1?Q?X1ys1Zxrhre72APTSTWYMYKW157vnnMCtvoCGoCe4hcK1ELzVRHuIwv+B5?=
 =?iso-8859-1?Q?iiJc5UEl+ReU3kJmH5j4CnOM7UCq9qv/Upa7425IVkasVvAHE50VFaahEA?=
 =?iso-8859-1?Q?PguXpvOfSI8bwsQwyuRSrGlrys447dwulX3TysAyu/4tFacAa84tz1CpX6?=
 =?iso-8859-1?Q?GsFru8v89P6+ZdNp3PoyvSopWCf7pNqIicEWk8RVHlWwLIQwpROK20xpSQ?=
 =?iso-8859-1?Q?PP65faxiVHHKU4Kyp7A=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR15MB2810CE8DAEDDEC50D005C058CE8C9DM6PR15MB2810namp_"
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB2810.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85eb4b78-b0c3-4c2f-2d11-08da690d14e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 22:30:13.1736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95F9ir/QftMcOBg71UkuToFTXtwLA0b9O5KwDUR4ykfZS6fQmuxk53A/s0fUtKxy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1459
X-Proofpoint-GUID: c3brjFkBEQKzu4z200SAkcfsV3_-hbc_
X-Proofpoint-ORIG-GUID: c3brjFkBEQKzu4z200SAkcfsV3_-hbc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180092
X-Mailman-Approved-At: Tue, 19 Jul 2022 09:15:06 +1000
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
Cc: George Wilson <gcwilson@linux.ibm.com>, Paul Mackerras <paulus@samba.org>, Brian J King <bjking1@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_DM6PR15MB2810CE8DAEDDEC50D005C058CE8C9DM6PR15MB2810namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Comments inline.
Reviewed-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>

________________________________
From: Nayna Jain <nayna@linux.ibm.com>
Sent: Tuesday, July 12, 2022 7:59 PM
To: linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>; Benjamin Herrenschmidt <benh@ker=
nel.crashing.org>; Paul Mackerras <paulus@samba.org>; George Wilson <gcwils=
on@linux.ibm.com>; Gregory Joyce <gjoyce@ibm.com>; Nayna Jain <nayna@linux.=
ibm.com>
Subject: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore

PowerVM provides an isolated Platform Keystore(PKS) storage allocation
for each LPAR with individually managed access controls to store
sensitive information securely. It provides a new set of hypervisor
calls for Linux kernel to access PKS storage.

Define PLPKS driver using H_CALL interface to access PKS storage.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---


+
+static int construct_auth(u8 consumer, struct plpks_auth **auth)
+{
+       pr_debug("max password size is %u\n", config->maxpwsize);

Are the pr_debugs in this function still needed?

+
+       if (!auth || consumer > 3)
+               return -EINVAL;
+
+       *auth =3D kmalloc(struct_size(*auth, password, config->maxpwsize),
+                       GFP_KERNEL);
+       if (!*auth)
+               return -ENOMEM;
+
+       (*auth)->version =3D 1;
+       (*auth)->consumer =3D consumer;
+       (*auth)->rsvd0 =3D 0;
+       (*auth)->rsvd1 =3D 0;
+       if (consumer =3D=3D PKS_FW_OWNER || consumer =3D=3D PKS_BOOTLOADER_=
OWNER) {
+               pr_debug("consumer is bootloader or firmware\n");
+               (*auth)->passwordlength =3D 0;
+               return 0;
+       }
+
+       (*auth)->passwordlength =3D (__force __be16)ospasswordlength;
+
+       memcpy((*auth)->password, ospassword,
+              flex_array_size(*auth, password,
+              (__force u16)((*auth)->passwordlength)));
+       (*auth)->passwordlength =3D cpu_to_be16((__force u16)((*auth)->pass=
wordlength));
+
+       return 0;
+}
+
+/**
+ * Label is combination of label attributes + name.
+ * Label attributes are used internally by kernel and not exposed to the u=
ser.
+ */
+static int construct_label(char *component, u8 varos, u8 *name, u16 namele=
n, u8 **label)
+{
+       int varlen;
+       int len =3D 0;
+       int llen =3D 0;
+       int i;
+       int rc =3D 0;
+       u8 labellength =3D MAX_LABEL_ATTR_SIZE;
+
+       if (!label)
+               return -EINVAL;
+
+       varlen =3D namelen + sizeof(struct label_attr);
+       *label =3D kzalloc(varlen, GFP_KERNEL);
+
+       if (!*label)
+               return -ENOMEM;
+
+       if (component) {
+               len =3D strlen(component);
+               memcpy(*label, component, len);
+       }
+       llen =3D len;
+

I guess the 8, 1, and 5 are field lengths. Could they be a define or sizeof=
?

+       if (component)
+               len =3D 8 - strlen(component);
+       else
+               len =3D 8;
+
+       memset(*label + llen, 0, len);
+       llen =3D llen + len;
+
+       ((*label)[llen]) =3D 0;
+       llen =3D llen + 1;
+
+       memcpy(*label + llen, &varos, 1);
+       llen =3D llen + 1;
+
+       memcpy(*label + llen, &labellength, 1);
+       llen =3D llen + 1;
+
+       memset(*label + llen, 0, 5);
+       llen =3D llen + 5;
+
+       memcpy(*label + llen, name, namelen);
+       llen =3D llen + namelen;
+
+       for (i =3D 0; i < llen; i++)
+               pr_debug("%c", (*label)[i]);
+
+       rc =3D llen;
+       return rc;
+}
+
+static int _plpks_get_config(void)
+{
+       unsigned long retbuf[PLPAR_HCALL_BUFSIZE] =3D {0};
+       int rc;
+       size_t size =3D sizeof(struct plpks_config);
+
+       config =3D kzalloc(size, GFP_KERNEL);
+       if (!config)
+               return -ENOMEM;
+
+       rc =3D plpar_hcall(H_PKS_GET_CONFIG,
+                        retbuf,
+                        virt_to_phys(config),
+                        size);
+
+       if (rc !=3D H_SUCCESS)

Free config before returning the error.

+               return pseries_status_to_err(rc);
+
+       config->rsvd0 =3D be32_to_cpu((__force __be32)config->rsvd0);
+       config->maxpwsize =3D be16_to_cpu((__force __be16)config->maxpwsize=
);
+       config->maxobjlabelsize =3D be16_to_cpu((__force __be16)config->max=
objlabelsize);
+       config->maxobjsize =3D be16_to_cpu((__force __be16)config->maxobjsi=
ze);
+       config->totalsize =3D be32_to_cpu((__force __be32)config->totalsize=
);
+       config->usedspace =3D be32_to_cpu((__force __be32)config->usedspace=
);
+       config->supportedpolicies =3D be32_to_cpu((__force __be32)config->s=
upportedpolicies);
+       config->rsvd1 =3D be64_to_cpu((__force __be64)config->rsvd1);
+
+       configset =3D true;
+
+       return 0;
+}
+
+static int plpks_confirm_object_flushed(u8 *label, u16 labellen)
+{
+       unsigned long retbuf[PLPAR_HCALL_BUFSIZE] =3D {0};
+       int rc;
+       u64 timeout =3D 0;
+       struct plpks_auth *auth;
+       u8 status;
+       int i;
+

Deleted pr_debugs? I guess this is a general question for all pr_debugs in =
this file.

+       rc =3D construct_auth(PKS_OS_OWNER, &auth);
+       if (rc)
+               return rc;
+
+       for (i =3D 0; i < labellen; i++)
+               pr_debug("%02x ", label[i]);
+
+       do {
+               rc =3D plpar_hcall(H_PKS_CONFIRM_OBJECT_FLUSHED,
+                                retbuf,
+                                virt_to_phys(auth),
+                                virt_to_phys(label),
+                                labellen);
+
+               status =3D retbuf[0];
+               if (rc) {
+                       pr_info("rc is %d, status is %d\n", rc, status);
+                       if (rc =3D=3D H_NOT_FOUND && status =3D=3D 1)
+                               rc =3D 0;
+                       break;
+               }
+
+               pr_debug("rc is %d, status is %d\n", rc, status);
+
+               if (!rc && status =3D=3D 1)
+                       break;
+
+               usleep_range(PKS_FLUSH_SLEEP, PKS_FLUSH_SLEEP + PKS_FLUSH_S=
LEEP_RANGE);
+               timeout =3D timeout + PKS_FLUSH_SLEEP;
+               pr_debug("timeout is %llu\n", timeout);
+
+       } while (timeout < PKS_FLUSH_MAX_TIMEOUT);
+
+       rc =3D pseries_status_to_err(rc);
+
+       kfree(auth);
+
+       return rc;
+}
+

+EXPORT_SYMBOL(plpks_remove_var);
XPORT_SYMBOL(plpks_get_config);
+
+static __init int pseries_plpks_init(void)
+{
+       int rc =3D 0;
+
+       rc =3D _plpks_get_config();
+
+       if (rc) {

I think this pr_err would be better if provided more info like the pr_info =
below.

+               pr_err("Error initializing plpks\n");
+               return rc;
+       }
+
+       rc =3D plpks_gen_password();
+       if (rc) {
+               if (rc =3D=3D H_IN_USE) {
+                       rc =3D 0;
+               } else {

I think this pr_err would be better if provided more info like the pr_info =
below.

+                       pr_err("Failed setting password %d\n", rc);
+                       rc =3D pseries_status_to_err(rc);
+                       return rc;
+               }
+       }
+
+       pr_info("POWER LPAR Platform Keystore initialized successfully\n");
+
+       return rc;
+}
+arch_initcall(pseries_plpks_init);
--
2.27.0


--_000_DM6PR15MB2810CE8DAEDDEC50D005C058CE8C9DM6PR15MB2810namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Comments inline.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Reviewed-by:&nbsp;Greg Joyce &lt;gjoyce@linux.vnet.ibm.com&gt;</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Nayna Jain &lt;nayna@=
linux.ibm.com&gt;<br>
<b>Sent:</b> Tuesday, July 12, 2022 7:59 PM<br>
<b>To:</b> linuxppc-dev@lists.ozlabs.org &lt;linuxppc-dev@lists.ozlabs.org&=
gt;<br>
<b>Cc:</b> Michael Ellerman &lt;mpe@ellerman.id.au&gt;; Benjamin Herrenschm=
idt &lt;benh@kernel.crashing.org&gt;; Paul Mackerras &lt;paulus@samba.org&g=
t;; George Wilson &lt;gcwilson@linux.ibm.com&gt;; Gregory Joyce &lt;gjoyce@=
ibm.com&gt;; Nayna Jain &lt;nayna@linux.ibm.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] powerpc/pseries: define driver for Platform Key=
Store</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">PowerVM provides an isolated Platfo=
rm Keystore(PKS) storage allocation<br>
for each LPAR with individually managed access controls to store<br>
sensitive information securely. It provides a new set of hypervisor<br>
calls for Linux kernel to access PKS storage.<br>
<br>
Define PLPKS driver using H_CALL interface to access PKS storage.<br>
<br>
Signed-off-by: Nayna Jain &lt;nayna@linux.ibm.com&gt;<br>
---<br>
&nbsp;<br>
<br>
+<br>
+static int construct_auth(u8 consumer, struct plpks_auth **auth)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;max password size is %=
u\n&quot;, config-&gt;maxpwsize);</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Are the pr_debugs in this function =
still needed?</div>
<div class=3D"PlainText elementToProof"><br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!auth || consumer &gt; 3)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *auth =3D kmalloc(struct_size(*auth, =
password, config-&gt;maxpwsize),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!*auth)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -ENOMEM;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*auth)-&gt;version =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*auth)-&gt;consumer =3D consumer;<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*auth)-&gt;rsvd0 =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*auth)-&gt;rsvd1 =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (consumer =3D=3D PKS_FW_OWNER || c=
onsumer =3D=3D PKS_BOOTLOADER_OWNER) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_debug(&quot;consumer is bootloader or firmware\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (*auth)-&gt;passwordlength =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*auth)-&gt;passwordlength =3D (__for=
ce __be16)ospasswordlength;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy((*auth)-&gt;password, ospasswo=
rd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; flex_array_size(*auth, password,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (__force u16)((*auth)-&gt;passwordlength)));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*auth)-&gt;passwordlength =3D cpu_to=
_be16((__force u16)((*auth)-&gt;passwordlength));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+}<br>
+<br>
+/**<br>
+ * Label is combination of label attributes + name.<br>
+ * Label attributes are used internally by kernel and not exposed to the u=
ser.<br>
+ */<br>
+static int construct_label(char *component, u8 varos, u8 *name, u16 namele=
n, u8 **label)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int varlen;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int len =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int llen =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 labellength =3D MAX_LABEL_ATTR_SIZ=
E;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!label)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; varlen =3D namelen + sizeof(struct la=
bel_attr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *label =3D kzalloc(varlen, GFP_KERNEL=
);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!*label)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -ENOMEM;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (component) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; len =3D strlen(component);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; memcpy(*label, component, len);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llen =3D len;<br>
+</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">I guess the 8, 1, and 5 are field l=
engths. Could they be a define or sizeof?</div>
<div class=3D"PlainText elementToProof"><br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (component)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; len =3D 8 - strlen(component);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; len =3D 8;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(*label + llen, 0, len);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llen =3D llen + len;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((*label)[llen]) =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llen =3D llen + 1;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(*label + llen, &amp;varos, 1);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llen =3D llen + 1;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(*label + llen, &amp;labellengt=
h, 1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llen =3D llen + 1;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(*label + llen, 0, 5);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llen =3D llen + 5;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(*label + llen, name, namelen);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; llen =3D llen + namelen;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; llen; i++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_debug(&quot;%c&quot;, (*label)[i]);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D llen;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rc;<br>
+}<br>
+<br>
+static int _plpks_get_config(void)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long retbuf[PLPAR_HCALL_BUFS=
IZE] =3D {0};<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t size =3D sizeof(struct plpks_c=
onfig);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config =3D kzalloc(size, GFP_KERNEL);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!config)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -ENOMEM;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D plpar_hcall(H_PKS_GET_CONFIG,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retbuf,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; virt_to_ph=
ys(config),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc !=3D H_SUCCESS)</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Free config before returning the er=
ror.</div>
<div class=3D"PlainText elementToProof"><br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return pseries_status_to_err(rc);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;rsvd0 =3D be32_to_cpu((__f=
orce __be32)config-&gt;rsvd0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;maxpwsize =3D be16_to_cpu(=
(__force __be16)config-&gt;maxpwsize);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;maxobjlabelsize =3D be16_t=
o_cpu((__force __be16)config-&gt;maxobjlabelsize);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;maxobjsize =3D be16_to_cpu=
((__force __be16)config-&gt;maxobjsize);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;totalsize =3D be32_to_cpu(=
(__force __be32)config-&gt;totalsize);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;usedspace =3D be32_to_cpu(=
(__force __be32)config-&gt;usedspace);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;supportedpolicies =3D be32=
_to_cpu((__force __be32)config-&gt;supportedpolicies);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config-&gt;rsvd1 =3D be64_to_cpu((__f=
orce __be64)config-&gt;rsvd1);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; configset =3D true;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+}<br>
+<br>
+static int plpks_confirm_object_flushed(u8 *label, u16 labellen)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long retbuf[PLPAR_HCALL_BUFS=
IZE] =3D {0};<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 timeout =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct plpks_auth *auth;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 status;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Deleted pr_debugs? I guess this is =
a general question for all pr_debugs in this file.</div>
<div class=3D"PlainText elementToProof"><br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D construct_auth(PKS_OS_OWNER, &=
amp;auth);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return rc;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; labellen; i++)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_debug(&quot;%02x &quot;, label[i]);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; rc =3D plpar_hcall(H_PKS_CONFIRM_OBJECT_FLUSHED,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retbuf,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; virt_to_phys(auth),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; virt_to_phys(label),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; labellen);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; status =3D retbuf[0];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (rc) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_info(&quot;rc=
 is %d, status is %d\n&quot;, rc, status);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc =3D=3D H_=
NOT_FOUND &amp;&amp; status =3D=3D 1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_debug(&quot;rc is %d, status is %d\n&quot;, rc, status);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!rc &amp;&amp; status =3D=3D 1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; usleep_range(PKS_FLUSH_SLEEP, PKS_FLUSH_SLEEP + PKS_FLUSH_SLEEP_=
RANGE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; timeout =3D timeout + PKS_FLUSH_SLEEP;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_debug(&quot;timeout is %llu\n&quot;, timeout);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while (timeout &lt; PKS_FLUSH_MAX_T=
IMEOUT);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D pseries_status_to_err(rc);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(auth);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rc;<br>
+}<br>
+<br>
<br>
+EXPORT_SYMBOL(plpks_remove_var);<br>
XPORT_SYMBOL(plpks_get_config);<br>
+<br>
+static __init int pseries_plpks_init(void)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D _plpks_get_config();<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc) {</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">I think this pr_err would be better=
 if provided more info like the pr_info below.</div>
<div class=3D"PlainText elementToProof"><br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_err(&quot;Error initializing plpks\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return rc;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D plpks_gen_password();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (rc =3D=3D H_IN_USE) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof"><span style=3D"background-color:rgb=
(255, 255, 255);display:inline !important">I think this pr_err would be bet=
ter if provided more info like the pr_info below.</span></div>
<div class=3D"PlainText elementToProof"><br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Fai=
led setting password %d\n&quot;, rc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D pseries_s=
tatus_to_err(rc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rc;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_info(&quot;POWER LPAR Platform Key=
store initialized successfully\n&quot;);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rc;<br>
+}<br>
+arch_initcall(pseries_plpks_init);<br>
-- <br>
2.27.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR15MB2810CE8DAEDDEC50D005C058CE8C9DM6PR15MB2810namp_--
