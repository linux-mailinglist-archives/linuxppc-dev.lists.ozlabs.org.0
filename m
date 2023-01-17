Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E061670F46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxS9q5RCDz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 12:00:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=u6/j1KQG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tOCS6Hax;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=u6/j1KQG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tOCS6Hax;
	dkim-atps=neutral
X-Greylist: delayed 6041 seconds by postgrey-1.36 at boromir; Wed, 18 Jan 2023 11:59:53 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxS8n2tSQz3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 11:59:51 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HLxCsH003616;
	Tue, 17 Jan 2023 23:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=il1+Ve7oMpWk67CFQoiC2P+ktHpCT7TD996Nn3Ca6As=;
 b=u6/j1KQG6eenuB+T+UGnOSABZ2F8mS4OG2UlZOacCFdPHTuPsjvNMNpOfBtTpLXhjVmZ
 hWx0lsK7yQypWydMZ4yhOMjn8Z5ywUkUD26fAeuyaRmj5sEBVaIePZZxs8jzkS+Ci44M
 sxBZr1zijTORDunrVve+h4KtCT4xAgXGpeVElWZnq9YIFhKANij0PjjAzZ+4mbQwtLXq
 BRTqmK5sJkEqhKXqC3cU5+U8Ld+LXzYLjhqedM9JU68UQ7JVavVg+8MNFnYdxt647oTu
 OC93vsk5EGq9tmFOmD6brnSyiFiVaY+TbWhHlSgQNxVt1Xgn/Hb/kBfRzD2u8qc/clOu oA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n3mxt686h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jan 2023 23:18:08 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30HMrxuT021206;
	Tue, 17 Jan 2023 23:18:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n64vcrq4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jan 2023 23:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llloJSNS0vdQR1FzzgWuZlpdUt1XdWl+VyAdQyJhaSQLxLW7wqWmc6JJ+KNfQWiCGntuAKMrRqngetZcd2jZx0S2AUlP61w88l7m782fgJ88srtD0WY0NXhwhb5JL9XjiPdsx1IW/nc3lTzsOiYeP2t6SOzjfD2kV1oB+0k1ZTHNRd/noGBs4mYphkc7kCxqsGPaZneEqZNEwflRg3ptzSzPWthrJHzRIZDienp6KlWK+6b/Kh0RqPmQ9NaKsx32nLuXzN2tXpeQkJhSErxY90g+2zXpMj1NpmMJ7tgMzl6/2YSpPp/uTXF6+5rIfTcFxmpCf6L5SN3dvCh5tfZpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il1+Ve7oMpWk67CFQoiC2P+ktHpCT7TD996Nn3Ca6As=;
 b=QUzjrM3C/ETIh64bNJOfjlNRMNofV028RRUO8By09w5EyPu50/QHARDtJBe41VDa2VjgyVPVDrSIP84MyrwqW2adUjkJZ8W/tNgIT1DII4a35G6ysUT1Q8MzsLyySqyj76iXLlTPnvFVrt9O1Jl5EC/tUnv2swGvS/PCsK0je7WlMsW4yAmsSXMGoZXlQXZbFig9zzxHgtpnIgcik4qfc52cj84NOTZijoEn7aD3HaV6n8tJC98YJJgtz2fvPkNWp3/P8ZjIGTHt6k7a1bk6cIRvMaq8dpHqxdKWPe+/6qco+DBHCVv+t2giR6mssEd6VCav3s8v3fEfp/vcAPHU+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il1+Ve7oMpWk67CFQoiC2P+ktHpCT7TD996Nn3Ca6As=;
 b=tOCS6HaxZbA5kkGupl1QMLIoXQHSClsnWL3rMBi8oq10/gsqpJccDKYB8WDOt/3Uz/Zwg5vH8VrOyLRlQe0eWkooISWtK9G91LApCoYtJQLo2zBQckRVO4qXi5Iu8LftnJC8UlyJH+HCtjCegveUqMoQEnKEWotbIVI9tPXOulk=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BL3PR10MB6017.namprd10.prod.outlook.com (2603:10b6:208:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.9; Tue, 17 Jan
 2023 23:18:03 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::a02:2ac8:ee3e:682]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::a02:2ac8:ee3e:682%4]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 23:18:03 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
Thread-Topic: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
Thread-Index: AQHZJGyfeVOZgHFEukOrFFAlqbUFgq6jJWgAgAAlmwA=
Date: Tue, 17 Jan 2023 23:18:03 +0000
Message-ID: <20230117231756.tlfk7zjtpk6uio4j@revolver>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-29-surenb@google.com>
 <CAG48ez2cK1M=fgkYi4bPdWX7uOm15Omv6EjFgXUkS2QsqiwGSg@mail.gmail.com>
In-Reply-To:  <CAG48ez2cK1M=fgkYi4bPdWX7uOm15Omv6EjFgXUkS2QsqiwGSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR10MB3022:EE_|BL3PR10MB6017:EE_
x-ms-office365-filtering-correlation-id: 09e1b42e-7711-48eb-b972-08daf8e1150f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gtotweTpGl8EtuUoSNOhGKwwwPHfP0ibtnzyFhoLciE0kVvEMwWxkaZH0CoqGWGA+7GFw2v3EFJ8lAKBW3pUJXvUNbL58+eNv6mAyMySWj5NEYmxFp3GXMESPIBF5tuc3291zmHI9R0Tirz8aIb/YFXkRcSBKrMeU2d8SKIMXv4wM8lDB0+Mkgx/od7FEgww2I41JqQEcRLtWuVH0fV6nJoiXjqognxrzPTNT3vvBzR2SOmmQhUgSyrqiB9Pio9gg/OCWHIa8vvHUZc4J0x+0UP5ViuX+MQZUcB+KJDbo50aaNqB7rtjdTEUtDEJsmS2J50lhr/cflLhjLS32w4R+Gr6sWERdj9T8BqePyO0KQ76oAmfD3oryrJVqjmX3xUJZ9gHiXzNZQLO2e8eYxogon1wyRb11BPklVpqRyKBixmU3hPLJSYcIjJL7zAZJyLAa0SwGIsSGqmj3yd5JWUt3PoLv01zlpWlTqe0xTnPS3VsOA7hP/TE8kC4lTIpIXBw7TbgbV6tJx8K62rYpyUV009sZH9rGACnFyE2NN1IjxzJQEOGAZJIUEA/+GrFwqFCzViC7cfcHx7Xi1MjE9TXcf/1QLuDF7k4dcVVaaDs/8DbzSsAnrg/Zc5lx1U/ePRPXyAAwDyiHvSTWAWL8YqcoIDZsnS7Adou3EYzttku+EYK/frSJc0HGiZoHR885uaMzb+yWvcD0WCPLlcFJE5hHg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(33716001)(66446008)(66556008)(66946007)(66476007)(186003)(76116006)(64756008)(41300700001)(91956017)(8676002)(6512007)(53546011)(26005)(9686003)(6916009)(4326008)(86362001)(8936002)(5660300002)(7416002)(83380400001)(7406005)(6506007)(54906003)(478600001)(1076003)(71200400001)(316002)(2906002)(6486002)(44832011)(122000001)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?bdR70oV3ubAfFIncKN61hruC2cB7R3gKG8bsENxyHVk7Sa7EcClDnF5EoKC8?=
 =?us-ascii?Q?Vr6RO1nWSZhM03wCW0jQaXMxQwHuoW8AdnUz8IT3LayswVwiEcMWt6VilcQQ?=
 =?us-ascii?Q?oXwiHHeqQbM0TzK3ajVuwfkIfqVsm3/CE6vUEBwkCeYXyrNjmc+CKwjjSzpI?=
 =?us-ascii?Q?CZgspyfFNpA5ySGWdIkshQMV0k+aWDTQ01huWBweb1Nu38e97XyZVzYMphqH?=
 =?us-ascii?Q?zc/up6nu54j/ch5Fz22U6mbNZ53tOJzH2p8bVgSovo7x5TfFwh/vYWzkxZa3?=
 =?us-ascii?Q?vOBwyF4lhccDGo3IEuXMJPB0k9v6whSwpdSU1FbOUPuXpEhNbNjJwAeFhcoQ?=
 =?us-ascii?Q?QRQP8hlSWXEpNf+mSEKWIKlaFuy2fP37DEHg6HUIJ2XO1dt22TRkqQWlAjpK?=
 =?us-ascii?Q?YyPikKu45WohQ/Vrg0qoOSBK1ru2FaVFvP0CyU4hfQLc+weXS7JVAClqEdvu?=
 =?us-ascii?Q?SZOqsnB38KJUIohcrvDsbEp4MeVThzzxv6AqPEGBNVLKGxdhp/WeHeC2c2Yu?=
 =?us-ascii?Q?jEXuZGU/kGkW32i0NTTTfrZ8zDwiTcVjR0Mvo3Y507fMyylGt7b4qCkU5TxZ?=
 =?us-ascii?Q?3GQEVo9z3ZhbJc52sd1oCAiHtm/GFjzLnu3UEKmKJ0gFD/WC8stteZ5psSfS?=
 =?us-ascii?Q?PmYYlS0W03kbejNt/aUNNuVTFX5yk2TMH6GFYlYruriaup6SCdW7XGrqBg4K?=
 =?us-ascii?Q?kAgiI4LyZCMKn7Do0cU/cir77ODS0jfv8vgXLAOmY2bUY8gMpqpGcSWGmfn/?=
 =?us-ascii?Q?WtG3fhDH1F96w1aG+vy5it58VwaJa0I5K5++4wqCKGxIY1L+682a4RAZkaR/?=
 =?us-ascii?Q?i+ag7S6RQ9JuvM68x+d7CF+K26JPwMBAihbGa82KP89p8VoLnLhHaY5jJ0X5?=
 =?us-ascii?Q?5z+r8bcR1VtD09iMK+V8KTgqQqsflYb909u58Ciu40u3nH0pEAg4YIhcgCmU?=
 =?us-ascii?Q?EljDAsFY6IS3tir+vKgqOV9eZDwf58AWTocVyRsJzcMNUZtUP3XWtIo0yEBf?=
 =?us-ascii?Q?j5vJKnMH5V5IeBjzwlbpPWq+J5eqeI88oRYCvJr5Dv9lUxyFjqF+OX+veR7C?=
 =?us-ascii?Q?CqBzGVH1M6+xp8XYqAYg5Ru/QlQGwu/Ge3kKno+zVUlC8Q1O2+e1KSLV/Wv8?=
 =?us-ascii?Q?V7t8YqLVd6mmEmql8T0UwBK89sKD4cWxGjEzuwm6bZ00bzRpGNHs2L23Qugm?=
 =?us-ascii?Q?xPzBZEg73o2nQOtgl2f80fBoFGnzbHl7lW2eOAMFzFGwJoMf/nKQ0XzTrNr/?=
 =?us-ascii?Q?CEeYkGeLlUPBOlpGNEuWcgDTvVKVrIAfJWdDMVEAQhi5uUtMn7XTSxleoY4a?=
 =?us-ascii?Q?OzcAYqPBU//r19EC0hQnPC55tR3ANXOqbTFL9C7rHWX9Js8xkiuMy/pQoObq?=
 =?us-ascii?Q?Qdc7qlOR6P1EKoOCkuPfyWai/T2/x1vYWeuIXronVf5xKZBMwHTqfyFUpccA?=
 =?us-ascii?Q?fA7q7vvHyyFzcA+2F0NAs5G1szODtfVBrOq0vroDiFu6WJ0TUaEInElLwYsL?=
 =?us-ascii?Q?0pjzVOFjwf03ucgDHtFfqG33FYqeTjXfMuUbHhrvWLF5gYsl+JF3sN9QPK01?=
 =?us-ascii?Q?zm7wtSiuiVkJ9UjtveTi1ozfmrTylrshMSboQlGIVGUJV8QJUw85psKIVeSJ?=
 =?us-ascii?Q?qQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E36ABDF8612A484B82DC0044CAD8E101@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?nAPSDS74dTxqIBYXHjdQ4QdCPSrn5S+wm5HJEEbYz4/itDwcCAAR6oh2HKOl?=
 =?us-ascii?Q?KOnfNnDm7MYhxY6yp2JtFh5Ev0iE9IcdV4uQA0mdTY2n5tuIEWxDjtTxb1rE?=
 =?us-ascii?Q?LRzwMxYCtaDe4Ef8sc4RYc3YjTH8Fe+E1qDY9pURm2GdyOFTbZh6Bm2yuN/I?=
 =?us-ascii?Q?qljHj/oKJ/32UqS+WN4aqHS+bMUgbR/UFjLPXPnlMBgg/yJuksOHkC0nveTD?=
 =?us-ascii?Q?el7ssJR6H3ac3G/dFWj/OhQTCYYGQPIBFWgC1WgaAQo78W00OUPxtnnwHhUU?=
 =?us-ascii?Q?pNcKH3N+yObzOauW0mvFm+V/1/G47HeQz3UeVu+XKLDa8LoBXXxFRilrZbJI?=
 =?us-ascii?Q?xFOxl3iLvxp3vBV7H7sCr6uHiVz5s8nOl23RT3llXGlS6EvZJOMWOv3j3Rhe?=
 =?us-ascii?Q?mfxAXdExCJZe7s2h+roQR1Of5kkcmSBI33uXtDqDGELclnDQNo1stpydeXfN?=
 =?us-ascii?Q?exKe9h9tS6Li4oJEo9PxeKbw+r6n9SDNXiXtfqsbCLVQrlpHPCjBRSM9O7Co?=
 =?us-ascii?Q?paAxMseKDnLZCJYK1QHpbQyqnAHG6npnUeITiMIPcoytbrwERC6pBF17j9Jk?=
 =?us-ascii?Q?3pxJcJoeRhxorUzmg7RwgXeWWcNBrwxDbEH4Rm3KaGumv4Apg0wz256Xlm57?=
 =?us-ascii?Q?QmO2YjfqJDlpg0qBOJZTkpFlJfRlPTIGu8J8NjobZPuCeep0DawYthq3oMX9?=
 =?us-ascii?Q?GzKWzEbp/fXRwPmIiTDMOGvRZUqo4KzQMMdrWdP/5eekxled/bYT3OWCuMOW?=
 =?us-ascii?Q?COSYIrdZmGQO7EWloUQPD0EbGrnH0CppQ0muaGsP7xUax6sxls/nXtyfLWfU?=
 =?us-ascii?Q?Vi2M0ZwIcgS93PA3OtGvedlVA9UbaNsV9CD6Z87eT/UU5XU/TFOy/kLoufz0?=
 =?us-ascii?Q?d0yvd/qb3hjZUXzv+BzxCpizysy5iQhxJBlv7vViPi8iRC1H7T4sxMFPrOvl?=
 =?us-ascii?Q?HQhsVGaoIRu/4CZFdqXCcvRaIAQw9Kgubpei1fACpO2lfhhK9cUDKVuMMPt+?=
 =?us-ascii?Q?FiRINauEsw9720P43xclbMJ3Wr0/BV3jk133EMAkC2pjm9j4EaNJj0qlqPt0?=
 =?us-ascii?Q?BKJam7yXrltYbUKn2wVhXRdZdEnH9RNPt3h6F1CVVfTXcFswuqKsHhUxeT4t?=
 =?us-ascii?Q?rCKfobXa+euhCCZqEiNQghC5Rin9kgfQ+efaNalpngEEH2cTt3qk1ZJkHz5M?=
 =?us-ascii?Q?0XWl9rNC6eQUHR7tk3tHBWt5iV5lUNAJAxmlU2mNdm5o1XXALxwC4IWyWRIA?=
 =?us-ascii?Q?gDMPb9sKkzEtjnyf/zssW9JQN/fDQ0tnBI3n3FemW7yaTytOKDTrEyCOyoWY?=
 =?us-ascii?Q?tFG+Uv7fnPo4YowhLyaSCJEDLvNGp89gC3D3aHwxwSv7/HKuyzUlFDm1+Jkq?=
 =?us-ascii?Q?4vDaxtX2+3SLBlwfaqgOhcJvExjndshY7M8mUz8i0NlbYo3Ja0hWCdRpOXIX?=
 =?us-ascii?Q?IFAoUVP6nl32I/tiecsno+qCdakUcD1dySRG6irscjGuiYaZJccxQYPwGQJU?=
 =?us-ascii?Q?vZSujK0EHa5ILKyiQ2PbNMafmyCuIRpXV0PC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e1b42e-7711-48eb-b972-08daf8e1150f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 23:18:03.0716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MeQ28oqHKVUmbd8KPNxCyo5pHXt08sbOPNwvFUvBmwaVcf8EPVGKw/xQ+UWhH/jqd57YcRRvtDStZK9VqbBbTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6017
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=638 adultscore=0 mlxscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170186
X-Proofpoint-GUID: ZzipPF0vWqs4V-Y_jxXYFWXOuLWrrPbe
X-Proofpoint-ORIG-GUID: ZzipPF0vWqs4V-Y_jxXYFWXOuLWrrPbe
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
Cc: "michel@lespinasse.org" <michel@lespinasse.org>, "joelaf@google.com" <joelaf@google.com>, "songliubraving@fb.com" <songliubraving@fb.com>, "mhocko@suse.com" <mhocko@suse.com>, "leewalsh@google.com" <leewalsh@google.com>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterx@redhat.com" <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "edumazet@google.com" <edumazet@google.com>, "jglisse@google.com" <jglisse@google.com>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "arjunroy@google.com" <arjunroy@google.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "minchan@google.com" <minchan@google.com>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, "gurua@google.com" <gurua@google.com>, "laurent.dufour@fr.ibm.com" <laurent.dufour@fr.ibm.com>, "linux-arm-kerne
 l@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rientjes@google.com" <rientjes@google.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "kernel-team@android.com" <kernel-team@android.com>, "soheil@google.com" <soheil@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "shakeelb@google.com" <shakeelb@google.com>, "luto@kernel.org" <luto@kernel.org>, "gthelen@google.com" <gthelen@google.com>, "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "posk@google.com" <posk@google.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, "peterjung1337@gmail.com" <peterjung1337@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "hughlynch@google.com" <hughlynch@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "akpm@linux-foundation.org" <akpm@linux-
 foundation.org>, "tatashin@google.com" <tatashin@google.com>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jann Horn <jannh@google.com> [230117 16:04]:
> On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wro=
te:
> > Introduce lock_vma_under_rcu function to lookup and lock a VMA during
> > page fault handling. When VMA is not found, can't be locked or changes
> > after being locked, the function returns NULL. The lookup is performed
> > under RCU protection to prevent the found VMA from being destroyed befo=
re
> > the VMA lock is acquired. VMA lock statistics are updated according to
> > the results.
> > For now only anonymous VMAs can be searched this way. In other cases th=
e
> > function returns NULL.
> [...]
> > +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > +                                         unsigned long address)
> > +{
> > +       MA_STATE(mas, &mm->mm_mt, address, address);
> > +       struct vm_area_struct *vma, *validate;
> > +
> > +       rcu_read_lock();
> > +       vma =3D mas_walk(&mas);
> > +retry:
> > +       if (!vma)
> > +               goto inval;
> > +
> > +       /* Only anonymous vmas are supported for now */
> > +       if (!vma_is_anonymous(vma))
> > +               goto inval;
> > +
> > +       if (!vma_read_trylock(vma))
> > +               goto inval;
> > +
> > +       /* Check since vm_start/vm_end might change before we lock the =
VMA */
> > +       if (unlikely(address < vma->vm_start || address >=3D vma->vm_en=
d)) {
> > +               vma_read_unlock(vma);
> > +               goto inval;
> > +       }
> > +
> > +       /* Check if the VMA got isolated after we found it */
> > +       mas.index =3D address;
> > +       validate =3D mas_walk(&mas);
>=20
> Question for Maple Tree experts:
>=20
> Are you allowed to use mas_walk() like this? If the first mas_walk()
> call encountered a single-entry tree, it would store mas->node =3D
> MAS_ROOT, right? And then the second call would go into
> mas_state_walk(), mas_start() would return NULL, mas_is_ptr() would be
> true, and then mas_state_walk() would return the result of
> mas_start(), which is NULL? And we'd end up with mas_walk() returning
> NULL on the second run even though the tree hasn't changed?

This is safe for VMAs.  There might be a bug in the tree regarding
re-walking with a pointer, but it won't matter here.

A single entry tree will be a pointer if the entry is of the range 0 - 0
(mas.index =3D=3D 0, mas.last =3D=3D 0).  This would be a zero sized VMA - =
which
is not valid.

The second walk will check if the maple node is dead and restart the
walk if it is dead.  If the node isn't dead (almost always the case),
then it will be a very quick walk.

After a mas_walk(), the maple state has mas.index =3D vma->vm_start
and mas.last =3D (vma->vm_end - 1). The address is set prior to the second
walk in case of a vma split where mas.index from the first walk
is on the other side of the split than address.

>=20
> > +       if (validate !=3D vma) {
> > +               vma_read_unlock(vma);
> > +               count_vm_vma_lock_event(VMA_LOCK_MISS);
> > +               /* The area was replaced with another one. */
> > +               vma =3D validate;
> > +               goto retry;
> > +       }
> > +
> > +       rcu_read_unlock();
> > +       return vma;
> > +inval:
> > +       rcu_read_unlock();
> > +       count_vm_vma_lock_event(VMA_LOCK_ABORT);
> > +       return NULL;
> > +}=
