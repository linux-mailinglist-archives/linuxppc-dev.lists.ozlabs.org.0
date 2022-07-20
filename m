Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C4257B7E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnxrr51BCz3cjR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:49:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsR3tguS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsR3tguS;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnxr62Hssz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:48:54 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KDgYXr029636;
	Wed, 20 Jul 2022 13:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iMNCl8tI4R9LrehDyoyIwsqdo8TUaItYszjVruZ8wDo=;
 b=QsR3tguSBedp7JG/cp0Ix/JozEK6zEn1YvXZrbecpVWyiWX6SeICXUU1iZ4YFUUnngR4
 O1hicDnjeeg/7LusqedB4AZHWp/8Li/PPsZXG86vkGy/kgS/Io82FT2C6ZanUnMjN45h
 Yb0TL+wepUDt8IGrQ/sZCkLuR+pGUtcwQat+8rbMpFc1Oo3PuxtzRB+3jVp1CKSlpQCR
 LiouV7wlRX55z4suIOq4Kt+Y0GioVO+1QIUo0qnPZZLG5IfRu4txZpuvke5wXtydbqb/
 n5pbXrSYsELspdSgzq3L/Tqf4/pnZCsgrt4L0QnDKv8qvjLe6fMr/Fcwy9lZm0WF4M/N WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejddh4wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:48:43 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26KDh4sr002537;
	Wed, 20 Jul 2022 13:48:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejddh4vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:48:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixWE9kAtyjVxrio5kmr78+hAAMEFw+FRjsY0VEYarwpZsT1DXtuaY/lOlMT1yIu+gUdfGCFIg/H0WMHDeyXl2fo2CCCRDnFZgec2G/jKmQQ63RmSvmDNfAI8gkwxu6/NRo5PAFOl5hR6gSmN+dX2StdL4r4lqIX/i9ZAuCxlXppnNCyoO5uwfaL7E7RW0PAy9L844t3LI6t4Laj+kBZU5bG7gJ/Zqd04QqGJR42PlS6urOZ4hLXqIxVEb4AbpwC6SXmvIVecVq+5U5LbCL/GUUQt8CXLijZlpl1GL04rgNgkVCf028+XeQ7KQdhgnra6k/cttzYZPupt9xxaeQ5qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMNCl8tI4R9LrehDyoyIwsqdo8TUaItYszjVruZ8wDo=;
 b=dCIKluYY0b6paDPIEd09ApIRl9bHTtDsrS3yefhcnPIwiLRhbr/ZAf7SxabC2ssyO503vCm3nN0wEOEj63RPF1QWl3JxhIAKeGP9TvMy93o5YDiSMSAmojfKAoS8JJnWH8RNB2NAEFN5ToRwa/YervuVMcqVatVs9iX6Wn6qKzBScMmLi/pTTjLumnVrtxQ6aH5v+0AV74rqBcDHPeZgYL9UIk3rM6xKxP6/7Y16cR67bcqwTTNV0gKIcUpE4A55yJsf0kX2vy1HiyukrzbvUN7toWFKyNHd37e8ySlNOVH74agrI1EeXbTBUaTfR+9/cXFi+WjnJHnaaYyJvdMSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from MWHPR15MB1150.namprd15.prod.outlook.com (2603:10b6:320:2f::8)
 by BYAPR15MB3175.namprd15.prod.outlook.com (2603:10b6:a03:105::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:48:40 +0000
Received: from MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f]) by MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f%5]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 13:48:40 +0000
From: Nageswara R Sastry <nasastry@in.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>,
        "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-integrity@vger.kernel.org"
	<linux-integrity@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 6/6] tpm/kexec: Duplicate TPM measurement log in
 of-tree for kexec
Thread-Topic: [PATCH v6 6/6] tpm/kexec: Duplicate TPM measurement log in
 of-tree for kexec
Thread-Index: AQHYkiXlRvOcnWW5WkS9TZ+L+lm4362HWhzc
Date: Wed, 20 Jul 2022 13:48:40 +0000
Message-ID:  <MWHPR15MB11506932B2AD3EDD6B439E13EB8E9@MWHPR15MB1150.namprd15.prod.outlook.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-7-stefanb@linux.ibm.com>
In-Reply-To: <20220707172026.831614-7-stefanb@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8015f5de-a6fe-48e8-7358-08da6a568dd5
x-ms-traffictypediagnostic: BYAPR15MB3175:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  waxd6cJgAdporI3Ckimw5566rmJy84y1P+9UTPDuC4mvxlBhpI1nfdhyZq8gRFddszYWtSG0xRGAPAtRu6HhhRGQs9aMqmlrdcljTmE/lueTFhTrU7r9zQo29QeUH/6uxqjOr60yOODnsHnuWzFoyVIbVIprOUIODD2QatLICemFTb1MSz80R5RAAsJnvPsI67rxFxhfb+TqaE1dL9W+fzQpnH2PUpA9qQEg7jvHGWNREV8maFvVofRPmnGAWn7GJupWUOgpseXSSln+92cPr1gTDzQKdLbhuqtb5MxUqyrJxbJKLvOHyyAFGNWTl7T9zS1EKNN7iFlRw2zG0SZHEW8A9Dmb/XSQpJ+sgQPqvbLE75oN+wQq80Lht8c+Oh8KRKhKJ814ZYCV7o04wLG853op1y2ux0SoOcuZ3fx0u560j9vgLVCenVyZMnn+9NFQJ55BXnvwVrXjiWStt/8nHeG+2FyxLkZZ4ipt6y/mWMLAGJZULrQZqCbpJFzXVCHmMOWfXxbpNrZaM8fO3dEec/qTQO34ahKHaU0i9uir+IPHPOB9OvhnTMC1LsaKy526wdevDY11LOanN2NcmHDVhzzU0Bm7qhiBb+zM+yh8ItuLkh38bfIYWsuuXKlzBrfVOpzfjW9KBwdIxF8YL/28Cnne6LHK0MULCaZjR5R6zdbUvcZ/Bw1J7zcYqKX/R08N09g9DiQxxGFqdwTsenZZlEjV+2zT36P1xQOs5lqpFAwYRgT4l0AhDHNhTbtqFbvi6Th/G2Ie+wITfLFigq/hH86IN4Zd/y5hnQwPn/oNrc1f9Y6WbW9kFCg1qdlSFOX9
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR15MB1150.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(366004)(396003)(346002)(316002)(54906003)(33656002)(186003)(110136005)(91956017)(83380400001)(6506007)(8676002)(66446008)(76116006)(66556008)(4326008)(64756008)(66476007)(9686003)(7696005)(55016003)(66946007)(26005)(53546011)(55236004)(478600001)(38070700005)(2906002)(71200400001)(41300700001)(52536014)(86362001)(122000001)(38100700002)(8936002)(7416002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?x7TzdpP7JZqW4p4+gzWa9+WdILYcVHy6H8/6AhfUh1khW71OvmQi0TAqOC?=
 =?iso-8859-1?Q?0kAiVWCRb3FSAnBBhyI2ZGhH69dCMP1IZw9xNE+iGypZdy6gFX3fSi1KE9?=
 =?iso-8859-1?Q?sSwHJPrvUgALAu6ejnqyqResea/lZKnHvDNT94vI7AtIEiqdYQymFhvvpL?=
 =?iso-8859-1?Q?agxJwVLD9YPn1wZZgDdL/SC7u4D14JqOutuE4g59wHprp7p5vEF5fWKvOs?=
 =?iso-8859-1?Q?EfBcgI1FLkI94clGxv/fPVjqWzsoujeT5BrxISFn6atbae7FQZnjvNC3Xc?=
 =?iso-8859-1?Q?MrLCdxeFAWX/rBnspm13eT3Citbdvy3YDq/d569pmV4KkJPe/ji3J+0xA8?=
 =?iso-8859-1?Q?BR9L85UcNTb84frp+TOdim18pfxzgIr9UYGqJWU2oRrX1i+np4TsTFdx5K?=
 =?iso-8859-1?Q?SRDKbwH5uAVi3uPaApVqx6N8w+wFn/09FNY1LOH+v8CwDfvYwIgHad7tg5?=
 =?iso-8859-1?Q?ldL4yLLdlUi5CxdbklxXrXUq/bi9O+024JtGs3PUhlsvyttO/S9PeBFgPZ?=
 =?iso-8859-1?Q?mmTyvK1vxNhGUtrWKb55YLIz5+7xd4kaYSRtLhXeSwxYKhyyiMf/E//c37?=
 =?iso-8859-1?Q?Kc+xBMsE9zGX4YUj0hbGAGQ7FrjR91ehsinTuWeRZRTI25DP4N1M1WWPZU?=
 =?iso-8859-1?Q?0gN87NZ3DpdCUuWNTlcJ38+iuwR2ndeX9UiTPZCljDR1HQX58XJIKuTzl/?=
 =?iso-8859-1?Q?0OjDlWCowUXNkOeNIAYUYcc9inbXbzOqq9lI6tgYNKBekdIO3ttvvTH3Nz?=
 =?iso-8859-1?Q?VoZcMzs6PhHrmNfazp+KGajBNqu6DTpOGwBGb23igCqakewtcDmrjpq/wU?=
 =?iso-8859-1?Q?f4ZvekxBc/prUkE1oZLB8Oh62H9VcRkvQR7cJeirbObxv0Fc3yCvvos9Fr?=
 =?iso-8859-1?Q?xzzGmsz7g+BgQcuYJVxNouo5voJlyByrzPl50+hLR+JPIzJ9iIoExNByN+?=
 =?iso-8859-1?Q?rgKpmToKtZXALhsCGQg0yRVY+Tjp93BRILw5mgBm2PSJBj8c4WDJyRK9ZW?=
 =?iso-8859-1?Q?for7NV+aayj6oisAmbKnil3NNJe20YWGxqeXBkpkv833/Ab0ZLbpyyY8XE?=
 =?iso-8859-1?Q?38Da6SmD7rz2tdXWldJYlsIpzkI5KzgEHKtzS4Z96wgIeoBugaFHgDEWq3?=
 =?iso-8859-1?Q?MmaCGd4KHWwFR7ADRYFonxXH+N2rVKDMysxOKV7ewsaOVn/a1tsHiL0gLj?=
 =?iso-8859-1?Q?32TePGhLcf/B+t55zZZaXsQ3Ou6hsZ1Eur8xJtmmMkl6DKkxDy7gfyE3Hz?=
 =?iso-8859-1?Q?2jeIjBqTBVF++fZeZ+hqejS1E1BTIYc0Hwbcl/gNGiMnDO0/kuWGk+AIs0?=
 =?iso-8859-1?Q?+AfBNh7VL3jQzFu6L6winCMULLURM0NKUqAwb9DpwLBaUN2b0jGpf1sAJS?=
 =?iso-8859-1?Q?JYT+7xXrlb3epRyBjr9p/K+8pZK1B8TDY++aRggnsYF4HhVOjvw5L112yK?=
 =?iso-8859-1?Q?y7DaIsYDhyCFR2iKIusCGJkcWjJCqCCpRVjeDJ6Dsr6//8mSUD0ObiKRg3?=
 =?iso-8859-1?Q?PjPe2W3AUObzb1a/IjJ9PuF0ZBEbsocWQfXy0W+JvZkJ7ZglQ8GqZVLBIt?=
 =?iso-8859-1?Q?yKbGN042EDjmawM7Szgau16sneWEUMH/uihpFTH6nRFaRD751lfuPhFAXQ?=
 =?iso-8859-1?Q?KcqUf6FpTRcGRb4cEeOkUTPdrSEyhzTRpu?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR15MB1150.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8015f5de-a6fe-48e8-7358-08da6a568dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:48:40.5185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8tfUm7oDujcnRw2B1CymmHErekaee+moY62dCmv1C+e5A+D1ONm4vev++XmjLIg9wgTdQ1oL7jg8pgVadSAO6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3175
X-Proofpoint-GUID: VklpyML0gldp2kJw4JTgT1BxG5B0_i8q
X-Proofpoint-ORIG-GUID: ERed2pv4qmLnWUP5Ee47tUXBVPfjyrAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_07,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200056
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
Cc: "nayna@linux.ibm.com" <nayna@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>, Eric Biederman <ebiederm@xmission.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=0A=
=0A=
________________________________________=0A=
> From: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Sent: 07 July 2022 10:50 PM=0A=
> To: kexec@lists.infradead.org; devicetree@vger.kernel.org; linux-integrit=
y@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.=
org=0A=
> Cc: nayna@linux.ibm.com; Nageswara R Sastry; mpe@ellerman.id.au; Stefan B=
erger; Rob Herring; Frank Rowand; Eric Biederman=0A=
> Subject: [PATCH v6 6/6] tpm/kexec: Duplicate TPM measurement log in of-tr=
ee for kexec=0A=
=0A=
> The memory area of the TPM measurement log is currently not properly=0A=
> duplicated for carrying it across kexec when an Open Firmware=0A=
> Devicetree is used. Therefore, the contents of the log get corrupted.=0A=
> Fix this for the kexec_file_load() syscall by allocating a buffer and=0A=
> copying the contents of the existing log into it. The new buffer is=0A=
> preserved across the kexec and a pointer to it is available when the new=
=0A=
> kernel is started. To achieve this, store the allocated buffer's address=
=0A=
> in the flattened device tree (fdt) under the name linux,tpm-kexec-buffer=
=0A=
> and search for this entry early in the kernel startup before the TPM=0A=
> subsystem starts up. Adjust the pointer in the of-tree stored under=0A=
> linux,sml-base to point to this buffer holding the preserved log. The TPM=
=0A=
> driver can then read the base address from this entry when making the log=
=0A=
> available. Invalidate the log by removing 'linux,sml-base' from the=0A=
> devicetree if anything goes wrong with updating the buffer.=0A=
=0A=
> Use subsys_initcall() to call the function to restore the buffer even if=
=0A=
> the TPM subsystem or driver are not used. This allows the buffer to be=0A=
> carried across the next kexec without involvement of the TPM subsystem=0A=
> and ensures a valid buffer pointed to by the of-tree.=0A=
=0A=
> Use the subsys_initcall(), rather than an ealier initcall, since=0A=
> page_is_ram() in get_kexec_buffer() only starts working at this stage.=0A=
=0A=
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Cc: Rob Herring <robh+dt@kernel.org>=0A=
> Cc: Frank Rowand <frowand.list@gmail.com>=0A=
> Cc: Eric Biederman <ebiederm@xmission.com>=0A=
=0A=
> ---=0A=
> v6:=0A=
> - Define prototype for tpm_add_kexec_buffer under same config options=0A=
>  as drivers/of/kexec.c is compiled, provide inline function otherwise.=0A=
>   (kernel test robot)=0A=
=0A=
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>=
