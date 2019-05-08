Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62713182DD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 02:28:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zvM73yhtzDq83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 10:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0031b2e447=guro@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="KT9JR6ht"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="fSm4qSSY"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zsxD1zH8zDqGC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 09:23:56 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x48NKJEj027789; Wed, 8 May 2019 16:23:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=H5fC9JblTjQZiLYREqZ2ytUM7ts3j5EOD20JR4Z90c0=;
 b=KT9JR6ht2gju4xN6JJ8s55gZTTIhp20U9IbDWUb2pUNiJoM1NWXsoYf83nRNo/CfhzXa
 fWxafa3BnDzujHgWdcxQcwG8MKTMgxT/68AoE7XsnpTTDOQLASUuSHnBwV7RV7bGsLlR
 0CLIvgBhWnIWYoxs4/JNXsayuLhykeCa/4c= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2sc2q3hdk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 08 May 2019 16:23:46 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 8 May 2019 16:23:45 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 8 May 2019 16:23:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5fC9JblTjQZiLYREqZ2ytUM7ts3j5EOD20JR4Z90c0=;
 b=fSm4qSSYIjbMlcMBVMGw5/eC1DG2MX5loB130QXibu2qs6QeY/bCuhGE7yNFznPaL1jrHGpRe9lQEREioFhljhc9IbyII4Eie4+N6BI4XxKjEl6NjSk5H4Ls6MHRzra1B0NlY1Dl2RxA6/EnFvxyJr5Au3+8SndxM9bTYeAcHQk=
Received: from BYAPR15MB2631.namprd15.prod.outlook.com (20.179.156.24) by
 BYAPR15MB3190.namprd15.prod.outlook.com (20.179.56.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Wed, 8 May 2019 23:23:43 +0000
Received: from BYAPR15MB2631.namprd15.prod.outlook.com
 ([fe80::ddd2:172e:d688:b5b7]) by BYAPR15MB2631.namprd15.prod.outlook.com
 ([fe80::ddd2:172e:d688:b5b7%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 23:23:43 +0000
From: Roman Gushchin <guro@fb.com>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [next-20190507][powerpc] WARN kernel/cgroup/cgroup.c:6008 with
 LTP ptrace01 test case
Thread-Topic: [next-20190507][powerpc] WARN kernel/cgroup/cgroup.c:6008 with
 LTP ptrace01 test case
Thread-Index: AQHVBYGVFpKJPUWNZkGh63rCVm6DZ6Zh3x+A
Date: Wed, 8 May 2019 23:23:43 +0000
Message-ID: <20190508232338.GB1104@tower.DHCP.thefacebook.com>
References: <A8995C41-9A8F-468C-89B2-AB6E44C7EADC@linux.vnet.ibm.com>
In-Reply-To: <A8995C41-9A8F-468C-89B2-AB6E44C7EADC@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:300:6c::26) To BYAPR15MB2631.namprd15.prod.outlook.com
 (2603:10b6:a03:152::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:524d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23ec2967-c492-4dd4-e863-08d6d40c35d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BYAPR15MB3190; 
x-ms-traffictypediagnostic: BYAPR15MB3190:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR15MB31903C93975530772613AF46BE320@BYAPR15MB3190.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(346002)(136003)(376002)(366004)(189003)(199004)(6436002)(186003)(2906002)(66476007)(66446008)(66556008)(73956011)(66946007)(76176011)(966005)(478600001)(68736007)(6916009)(6246003)(45080400002)(6486002)(71200400001)(71190400001)(102836004)(486006)(25786009)(5660300002)(33656002)(6116002)(305945005)(86362001)(6506007)(386003)(6512007)(7736002)(9686003)(64756008)(46003)(6306002)(4326008)(476003)(11346002)(446003)(53936002)(14454004)(99286004)(229853002)(54906003)(8936002)(14444005)(316002)(256004)(52116002)(1076003)(8676002)(81156014)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR15MB3190;
 H:BYAPR15MB2631.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V/y2n1r4DZn/AxLhuH+AFl6rxxrQjQWWzfJfxrQzf6vM3DSOPYwuKA9prsiBHGJO1vbaiW5bGiSPQa19P7RpNN9tENCHYQ7BF7TygWNMPXMvdYDF+ZakKkazscvubcAmvnDRAKsss+6UgQmxkWJhaf+s+UB/IcwoliyZ4CQFCWbq73fFla3TORxSaZ1377q+nejt1csHMB6K/9IL9kXVZshsj1w43ZL9jWItGNLFJBsxzEkfVMIFw1OmoeApcyPFhc/Ow9aQZBDwiuT00bX9eQ4D2qJEAOQkRfGBEdh6J27DT8IN2VnGDMFPmKyFBVUKJcVZreGjQaWN0qWaotJWKO0ELvwKV65w+ZSAOZyF8FR4P7pNwumxiBHRiyrag3hESdQWqjPmLBXMLWIRoSrBSb5fZDkf0JIbXzu96bNhIYQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6B81B6E0B27A043BA6B677A90CDEE32@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ec2967-c492-4dd4-e863-08d6d40c35d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 23:23:43.3004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3190
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Mailman-Approved-At: Thu, 09 May 2019 10:26:56 +1000
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
Cc: Tejun Heo <tj@kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDM6MDY6MzBQTSArMDUzMCwgU2FjaGluIFNhbnQgd3Jv
dGU6DQo+IFdoaWxlIHJ1bm5pbmcgTFRQIHRlc3RzKHNwZWNpZmljYWxseSBwdHJhY2UwMSkgZm9s
bG93aW5nIFdBUk5JTkcgaXMgb2JzZXJ2ZWQNCj4gb24gUE9XRVI4IExQQVIgcnVubmluZyBuZXh0
LTIwMTkwNTA3IGJ1aWx0IHVzaW5nIDRLIHBhZ2Ugc2l6ZS4NCj4gDQo+IFsgMzk2OS45Nzk0OTJd
IG1zZ3JjdjA0ICg0MzMpIHVzZWQgZ3JlYXRlc3Qgc3RhY2sgZGVwdGg6IDkzMjggYnl0ZXMgbGVm
dA0KPiBbIDM5ODEuNDUyOTExXSBtYWR2aXNlMDYgKDUxNSk6IGRyb3BfY2FjaGVzOiAzDQo+IFsg
NDAwNC41NzU3NTJdIFdBUk5JTkc6IENQVTogNSBQSUQ6IDcyMSBhdCBrZXJuZWwvY2dyb3VwL2Nn
cm91cC5jOjYwMDggY2dyb3VwX2V4aXQrMHgyYWMvMHgyYzANCj4gWyA0MDA0LjU3NTc4MV0gTW9k
dWxlcyBsaW5rZWQgaW46IG92ZXJsYXkgcnBhZGxwYXJfaW8gcnBhcGhwIGlwdGFibGVfbWFuZ2xl
IHh0X01BU1FVRVJBREUgaXB0YWJsZV9uYXQgbmZfbmF0IHh0X2Nvbm50cmFjayBuZl9jb25udHJh
Y2sgbmZfZGVmcmFnX2lwdjQgaXB0X1JFSkVDVCBuZl9yZWplY3RfaXB2NCB4dF90Y3B1ZHAgdHVu
IGJyaWRnZSBzdHAgbGxjIGt2bSBpcHRhYmxlX2ZpbHRlciBwc2VyaWVzX3JuZyBybmdfY29yZSB2
bXhfY3J5cHRvIGlwX3RhYmxlcyB4X3RhYmxlcyBhdXRvZnM0IFtsYXN0IHVubG9hZGVkOiBkdW1t
eV9kZWxfbW9kXQ0KPiBbIDQwMDQuNTc1ODM3XSBDUFU6IDUgUElEOiA3MjEgQ29tbTogcHRyYWNl
MDEgVGFpbnRlZDogRyAgICAgICAgICAgTyAgICAgIDUuMS4wLW5leHQtMjAxOTA1MDctYXV0b3Rl
c3QgIzENCj4gWyA0MDA0LjU3NTg0Nl0gTklQOiAgYzAwMDAwMDAwMWIzMDI2YyBMUjogYzAwMDAw
MDAwMWIzMDA1NCBDVFI6IGMwMDAwMDAwMDFjOWYwMjANCj4gWyA0MDA0LjU3NTg1NV0gUkVHUzog
YzAwMDAwMDE3MWZmZjg0MCBUUkFQOiAwNzAwICAgVGFpbnRlZDogRyAgICAgICAgICAgTyAgICAg
ICAoNS4xLjAtbmV4dC0yMDE5MDUwNy1hdXRvdGVzdCkNCj4gWyA0MDA0LjU3NTg2M10gTVNSOiAg
ODAwMDAwMDEwMjgyYjAzMyA8U0YsVkVDLFZTWCxFRSxGUCxNRSxJUixEUixSSSxMRSxUTVtFXT4g
IENSOiA0NDAwNDgyNCAgWEVSOiAyMDAwMDAwMA0KPiBbIDQwMDQuNTc1ODg1XSBDRkFSOiBjMDAw
MDAwMDAxYjMwMDc4IElSUU1BU0s6IDEgDQo+IFsgNDAwNC41NzU4ODVdIEdQUjAwOiBjMDAwMDAw
MDAxYjMwMDU0IGMwMDAwMDAxNzFmZmZhZDAgYzAwMDAwMDAwMzkzODcwMCBjMDAwMDAwMjdiMDJm
YTE4IA0KPiBbIDQwMDQuNTc1ODg1XSBHUFIwNDogYzAwMDAwMDI3YjAyZmEwMCAwMDAwMDAwMDAw
MDAwMDAwIGMwMDAwMDAwMDNhZTg3MDAgMDAwMDAwMDAwMDFjMTgwYSANCj4gWyA0MDA0LjU3NTg4
NV0gR1BSMDg6IDAwMDAwMDAwMDAwMDAwMDEgMDAwMDAwMDAwMDAwMDAwMSBjMDAwMDAwMDAzYWU4
NzAwIDAwMDAwMDAwMDAwMDAwMDEgDQo+IFsgNDAwNC41NzU4ODVdIEdQUjEyOiAwMDAwMDAwMDAw
MDA0NDAwIGMwMDAwMDAwMWVjN2VhODAgYzAwMDAwMDAwM2E0ZDY3MCAwMDAwMDAwMDAwMDAwMDA5
IA0KPiBbIDQwMDQuNTc1ODg1XSBHUFIxNjogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDQw
MTAwIDAwMDAwMDAwNDE4MDA0ZmMgMDAwMDAwMDAwODQzMDAwMCANCj4gWyA0MDA0LjU3NTg4NV0g
R1BSMjA6IDAwMDAwMDAwMDAwMDAwMDkgMDAwMDAwMDAwMDAwMDAwMSBjMDAwMDAwMTcxNWU5MjAw
IGMwMDAwMDAxNmQ4ZjRkMDAgDQo+IFsgNDAwNC41NzU4ODVdIEdQUjI0OiBjMDAwMDAwMTcxZmZm
ZDkwIDAwMDAwMDAwMDAwMDAxMDAgYzAwMDAwMDE2ODY5MjQ3OCBjMDAwMDAwMTcxZmZmYjk4IA0K
PiBbIDQwMDQuNTc1ODg1XSBHUFIyODogYzAwMDAwMDE2ODY5MjQwMCBjMDAwMDAwMTZkOGY0ZDAw
IGMwMDAwMDAwMDM2NDIwZDAgYzAwMDAwMDI3YjAyZmEwMCANCj4gWyA0MDA0LjU3NTk1OF0gTklQ
IFtjMDAwMDAwMDAxYjMwMjZjXSBjZ3JvdXBfZXhpdCsweDJhYy8weDJjMA0KPiBbIDQwMDQuNTc1
OTY2XSBMUiBbYzAwMDAwMDAwMWIzMDA1NF0gY2dyb3VwX2V4aXQrMHg5NC8weDJjMA0KPiBbIDQw
MDQuNTc1OTcyXSBDYWxsIFRyYWNlOg0KPiBbIDQwMDQuNTc1OTc5XSBbYzAwMDAwMDE3MWZmZmFk
MF0gW2MwMDAwMDAwMDFiMzAwNTRdIGNncm91cF9leGl0KzB4OTQvMHgyYzAgKHVucmVsaWFibGUp
DQo+IFsgNDAwNC41NzU5OTBdIFtjMDAwMDAwMTcxZmZmYjMwXSBbYzAwMDAwMDAwMTljZWE5OF0g
ZG9fZXhpdCsweDg3OC8weDFhZTANCj4gWyA0MDA0LjU3NTk5OV0gW2MwMDAwMDAxNzFmZmZjMDBd
IFtjMDAwMDAwMDAxOWNmZTRjXSBkb19ncm91cF9leGl0KzB4YWMvMHgxZDANCj4gWyA0MDA0LjU3
NjAwOV0gW2MwMDAwMDAxNzFmZmZjNDBdIFtjMDAwMDAwMDAxOWVkMDBjXSBnZXRfc2lnbmFsKzB4
MmJjLzB4MTFjMA0KPiBbIDQwMDQuNTc2MDE5XSBbYzAwMDAwMDE3MWZmZmQzMF0gW2MwMDAwMDAw
MDE4NjdiMTRdIGRvX25vdGlmeV9yZXN1bWUrMHgzODQvMHg5MDANCj4gWyA0MDA0LjU3NjAyOV0g
W2MwMDAwMDAxNzFmZmZlMjBdIFtjMDAwMDAwMDAxODNlODQ0XSByZXRfZnJvbV9leGNlcHRfbGl0
ZSsweDcwLzB4NzQNCj4gWyA0MDA0LjU3NjAzN10gSW5zdHJ1Y3Rpb24gZHVtcDoNCj4gWyA0MDA0
LjU3NjA0M10gMzE0YTAwMDEgN2Q0MDQ5MmQgNDBjMmZmZjQgM2Q0MjAwMWIgZTkyYTcyODggMzky
OTAwMDEgZjkyYTcyODggNGJmZmZlNWMgDQo+IFsgNDAwNC41NzYwNTZdIDNkNDIwMDFiIGU5MmE3
MjU4IDM5MjkwMDAxIGY5MmE3MjU4IDwwZmUwMDAwMD4gNGJmZmZlMGMgNGJlOTFlNDUgNjAwMDAw
MDAgDQo+IFsgNDAwNC41NzYwNzFdIC0tLVsgZW5kIHRyYWNlIDgyYTFhN2MxOTAwNWViZDYgXeKA
lA0KPiANCj4gVGhlIFdBUk5fT05DRSB3YXMgYWRkZWQgYnkgZm9sbG93aW5nIGNvbW1pdCANCj4g
OTZiOWM1OTJkZWY1ICgiY2dyb3VwOiBnZXQgcmlkIG9mIGNncm91cF9mcmVlemVyX2Zyb3plbl9l
eGl0KCnigJ0pLiANCj4gDQo+IFJldmVydGluZyB0aGUgcGF0Y2ggaGVscHMgYXZvaWQgdGhlIHdh
cm5pbmcuDQoNCkhpIFNhY2hpbiENCg0KVGhhbmsgeW91IGZvciB0aGUgcmVwb3J0IQ0KDQpDYW4g
eW91LCBwbGVhc2UsIGNoZWNrIHRoYXQgdGhlIHBhdGNoIGF0IGh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDE5LzUvOC85MzgNCnNvbHZlcyB0aGUgcHJvYmxlbT8NCg0KSSdsbCBhcHByZWNpYXRlIGl0
IQ0KDQpUaGFua3MhDQoNClJvbWFuDQo=
