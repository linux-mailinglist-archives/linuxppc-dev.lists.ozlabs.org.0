Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0FF6B221E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 12:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXR7t22n1z3f41
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 22:01:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=Y2vcWuc2;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=mYQB0dVu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.155.168; helo=esa5.hc3370-68.iphmx.com; envelope-from=prvs=4252f21a9=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=Y2vcWuc2;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=mYQB0dVu;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Thu, 09 Mar 2023 22:00:36 AEDT
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com [216.71.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXR6r4gJ2z3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 22:00:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678359636;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UnuV/38xlOW64y+2SYVpmaS7tmxXRTDy081Z9eGfTVU=;
  b=Y2vcWuc2W3Fru+s1s1ZLmOIj0ih0CspUO9C+e1Sh1pL2j3TxEkSPxRbS
   2219KR4Ml6NUwsqPwzvkSSlrWxAATjdLClSR61sLELyUij9qm81yjdtWE
   KfTRJUx4dcfZDdw8u9M9oOnDMJfNqazWGC8O+dmbWsXVuz6Nr2LeCsBLi
   Q=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 98953330
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1ZS9Wq+0SN/mMCOGP9ErDrUD+36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TAcDT+DOqnbamWnLdhzOt61/U5S7ZXcnNVhTApqri48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqga5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl1s
 sUEJDsUMCnZlvyHg5TjTrdOj/08eZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpjtABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr6fzH6gA9lKfFG+3sFrqwyPmFUBNDctaniQk+eFtFLhZOsKf
 iT4/QJr98De7neDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL84QmDAXMfZiVcc9Fgv8gzLRQlz
 FKGnNPBAT1pra2bTm+b+r6IrDS0fy8PIgcqZy4eTBAB6tPyiII+lBTCSpBkCqHdptn0Hyzgh
 jOHti4zg50NgsMRkaa251bKh3SrvJehZh444EDbU3yo6it9ZZW5fMq45F7D9/FCIY2FCF6bs
 xAsmcKT8eQPBpGljzGWTaMGG7TBz/yCKjzHx1l0A4Mm6S+u6lakZ4lb5Dw4L0BsWu4PeSXoe
 1D7ogRM/9pIO3/sarV4C6q0CsIlyoDtEcjoEPDJBvJJZp9/XAuG7CZrI0idwwjFlEkqjLEnI
 ZzefcuyJXIbErh8ij2kQ+4Xyvks3C9W+I/IbZXyzhDi1KXEYneQEO8BKAHXNr5/676YqgLI9
 doZL9GN1xhUTOz5ZG/Q7JIXKlcJa3M8APgatvBqSwJKGSI+cElJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:szxiuaiR1yFFwr88Je3JRxY8vHBQXvIji2hC6mlwRA09T+Wync
 rGpoVh6fY7skdpZJhAo6H5BEDkexnhHPFOkOws1NuZLWvbUS6TXeJfBOjZogEIeReOktK1vJ
 0IG8ND4Z/LbWSS5vyKhzVQfexQpuVvM5rFuQ4d9RpQpM1RBJ2IJj0WNjqm
X-IronPort-AV: E=Sophos;i="5.98,246,1673931600"; 
   d="scan'208";a="98953330"
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Mar 2023 05:59:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YydBXO71Tt+ttwaMlIIY8PKEdq+ZV7oz6Ke6w56RlDzEcgoEZc+LJ+2IwPgj6Y2vfWJgD3oiHv9PcsFDT3uv80HN4VjJhPVJpDui4hdzq+/hdkg2GWWugRjB8UqpbiA4RWuRbTy1qoE5LQUAY3h/pjR48Nbdgk2l20JRFB8IvDwfLYOYAbt+0AB2j9dPe+Yrq8TV/UeSk/IFZojQ4T+c1O/mvvmaZ37ty5shNVrSbGJJ3evbD57ddMytKTfD2hARjJHtY685jS1Aj71cBwD60FuhCjxQDpQ0udxtOEif9hcWWFQs6i1y6FRB7Ec6sB/Mdb7LUqKuOEWNpFP3CVQGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buZ3pymdN3LMIhtqum1619ORoNQIYxo0qAS2YKOqPg8=;
 b=SDD7PbdfH0Cv2iGSbnATdnCzanRHVcsoyGbA+4bHjkujNyn6/WQtwQqSBV1wbnchfb/thS+eBw5r1xIISnZOeWMPiz7lKB1U4eb2HMRXccTCyFyZCicUiJrmKOM/l2IwNXLB2BnagoiOVISL+PYzjhDE+n4tZcmjxCqSCCOOKVPbTgh665uLLq6xaZmhAG9IzcWFznKG+tBjAcsZMdzmcDibHgiHJgiTjzcBvCJjZUsztwl1db+XdWqjMEGmIWeyIU0jd0remBVGprVfrVEn5ZxdskNbzFyTc92ZUKkEpXuswxD+lAKoh11jbPM1BUjwDcGTbSJqCTobXvndP1DjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buZ3pymdN3LMIhtqum1619ORoNQIYxo0qAS2YKOqPg8=;
 b=mYQB0dVuaffuyWOaHrjfTTt6sZ0SVEKajsYM5LI93xDjvyzNyWsk9QMu7OTpxcqNV7hmhiZhwTL22qDGiH5Jm3hvRsFJk6qyqi+GPvcopZOTyhDFgExxlVZbb2Kt6aNs7K0+H7ObMgvMdO+jKdDkSo+ayNB3+Eqgcvl9KUufdMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5919.namprd03.prod.outlook.com (2603:10b6:a03:2d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.26; Thu, 9 Mar
 2023 10:59:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 10:59:21 +0000
Date: Thu, 9 Mar 2023 11:59:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
Message-ID: <ZAm8BDGTMaI0XmMI@Air-de-Roger>
References: <20221130150919.13935-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
 <Y4nkFZal7oy+aICa@Air-de-Roger>
 <Y5cgYLNwtPbmP1JL@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5cgYLNwtPbmP1JL@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0487.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 723112ee-049a-4c9b-7824-08db208d565d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eCFmQ2xy8qXSwNYN3LESqH+dcnoCoRgvcEs+xZKMPYzh+ATtKkO37swkSwWYFwqIhfeHCBkuMsdZ2oCA9HVjLCDWCeyLIDH9iLMV7Fj/P53/nmt7+BpC3x4xQsN8fOW5GiW5Y/tYWTdqJfm2KI4hKXKHfsTKU7hr8X2ANUT8USte2Aj2nko6xUnxo3X9kTU8lbhDmC70zcPqlI6XXqyTSUFsjXQz95JGQyB4TQr21PEWLiOXbD89dIZaYEXZtfiHtwnhbpgcnudhEIXoQmrA4ZfPJtwAHONOaMtAyXOb+VcpZz6u20Bxx0uRTCPC9b2yKttZ9hD7eEIoGXkHxuHqCtw6+5P0SkZqXCCdmyfEF6AwKdepB5F7QXbX0wjnNj1NzlGOIRdX5VH1FIiigXzu6P3dLKqdkSVDvLxQFPCC6iBmqcFJeBQb+ckFFErJdZjGDuL0gEInaCWAmFdfv847+tGbfKNsKPm38AR7qmjpvjuGtlxHP1qojvKKTw4+VLBZelT2VfPFSOI224J9txil5vDvn7ZwJkXlJ3KhKCNbK4itQmwQEEsCt276WzDPFij3H42dW2h12UFXJqriO1pr9UHzA+dxmgJn+D29lHSI5ytiQnufs2ODDjiJtLzOsTuLmJgWY07em4Ui91jracMEiQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199018)(6506007)(6512007)(6486002)(85182001)(82960400001)(83380400001)(38100700002)(86362001)(9686003)(186003)(26005)(6666004)(66946007)(41300700001)(8676002)(4326008)(2906002)(33716001)(66476007)(8936002)(5660300002)(7416002)(478600001)(66556008)(316002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OFhKM1A0ZVVEQzRsY1c5SjBZTk9WWkNmK0JmdElyQXdFYURiTXFoV2Q3RXBS?=
 =?utf-8?B?Q2MxR3lkMTN2eFc3OVVMVGNwWmJ0aklKSUpJZ1RFOWVYZjRMMmMvUWg5aGow?=
 =?utf-8?B?ZW5meUdqN3lKUnYwRm5xM0ZkM2RTbVRpRUZESFZJQ3NLNGI4NElmNnlXSGk1?=
 =?utf-8?B?VlNuVnlWejBwY0FzUVJGb0JkVnlaSkE0TnhJWUwrNHMxWE1zbXlKUHRWakNQ?=
 =?utf-8?B?bWJ5eWFENld2ZDdSdE1VWW5WWVE4cGpWclJOVDNEMXI0bUQ4OCtTR2FBUjVB?=
 =?utf-8?B?T3hZbGhIREFGVlRXcWNwdEc2dUFMZkpSQkVuSkVqNXdlNHRhWlZPczlkMjhY?=
 =?utf-8?B?QllyMWNjTmFhM2VHeXhFN0dLbFN0b1Z1cTh5QmJEbHlnRHlNcTByMFVaQWdy?=
 =?utf-8?B?WEpQa1FwaW1LbDRENDEyOUx4czVVMkxRTUFyaDJ2ZXJSWHlwTzlmNGlic3Bz?=
 =?utf-8?B?T2dmN3ZBM3lPN1U2R3pJN0QydWxzSlAwVFEyME5rM3d4Z0tQOGU3QmpiWDZt?=
 =?utf-8?B?Sk5sa1ArQnVYLzB0ck1wbmNzMnl0VjlmUmdzQlkzQURxamtkR3BIcm8yVE11?=
 =?utf-8?B?SGZWNXUybi8vNzlRSDlHZUZzS1h5dzJKZ2JsVlU5SkNOam1OaExmS3YxaGFG?=
 =?utf-8?B?a29vUEFxV2N5ZEZmbUNXcFg2cXNSc2ZjSGZLdzZLYVRLMllPK3BsZmlDN0U5?=
 =?utf-8?B?OTRhcTRUK3p0YTErNjBlMkc1c1JmcWVKeGU5Q2s2MGY4WC82WnN4ZmFVRG54?=
 =?utf-8?B?bDBZdmF0MjJVVFNXTnhpazRzckZjS3FpWnBtWTBuUVNETkFLcFRZRy8yVXg5?=
 =?utf-8?B?SmxLd1JzYVlsSFl2QVgreFhyRk9aMFlId1ZuRlRVUVhQalFOd2duTk4yVEs3?=
 =?utf-8?B?TWRFMGp6RFdyYWh6WEdtTFZvbGxzdnlCdDdBRk9wSklKNFlJU3Z5S2UrRjJB?=
 =?utf-8?B?dndWSHB6V2dxaGtkS3YvNXFzWURTdG1JRkNWTCtZcC96bTRhcGJlVzdIZTRm?=
 =?utf-8?B?bzVXa3RZVjBTRXlNYUZUaDM1WU1ieGJ2ZGhJQ09tdFpWaGl1ZkFsNjczVTlt?=
 =?utf-8?B?ZmMrZ0QyVmlpR1JXVm9jemFuMUpsVVlVcjZPUS84VGYxc2xKbVl2NTVvdXpQ?=
 =?utf-8?B?eXJVc0U3TGEzQWZwejdXTWk4Q3hnWEpjWGZ3K3BOQ0ZHd3dBMnJPMkVYUVJO?=
 =?utf-8?B?TmgwdVcvSDBYSVF4ZUtUSUdGb2IxUHJjREFkVEFrOU5NdkJHYUZBZS9LVWVN?=
 =?utf-8?B?VUc4TUsrMm5YcUN3U1QrUTZzVVBTTk4za3VxNU05eWN3cnJRRE51Y1daeWFO?=
 =?utf-8?B?dlhRTWhVbitHYnFqb2Q5aDRDZEwrUGNQWHFmR1V5bHVoY2JtVG9mVjlPWXpv?=
 =?utf-8?B?Q0dJM1N0NEFNeTc0bzBFdU51UzBtdExnZDBiL1F1Ukt0VURTejNZcFFENEx1?=
 =?utf-8?B?b1FaRHV0dVFubkRJK1dldGlTSHVJYjdyQjBaM2RZTnVTSE5yRjV6VjBGSC9t?=
 =?utf-8?B?U093RjBoK3MyM0tobVRDalh1QXNuR1BNc0toOWIzQ01MajI3M1VwMlNWQ0Q0?=
 =?utf-8?B?M29qZXNCc2ZrK1k0ZVllNjdOUWhua3N6VnN0ZjlmWWhDd25kdStaS1ZhM1JD?=
 =?utf-8?B?R2toYVREM1ROZThGZytrdkppdjJBek1pNG44Tks5RzU0VEl4bFU3emdmWVRM?=
 =?utf-8?B?d1hRQzZIMlNKYThReTRUdE4yMjEyTnNNeGxwWG1aUFg1Qk5LT3FqSmtheW15?=
 =?utf-8?B?eWx4MlZDUnFuQmxIcGhkTEhESmtiV0piQW1jU1czeWJ2bjZWaXhxZWI0T3Fn?=
 =?utf-8?B?azk0Yy94VVAzK3dFZnV3eHAyQmdqOXlwNDFiSHREdTY5eElUL2ovbUtWV1Y4?=
 =?utf-8?B?MHY0V3F6ZG9hc0llcU5mWUdjeXZFSFVMbWxjSXZOdE9JSzM0UzBnekN3RWtX?=
 =?utf-8?B?VGhLSmx3L3c2L3NOTmx0ampDUm1GWUNhZjBOZDB4M3VCOWR1cGxzV1RQK3dl?=
 =?utf-8?B?dmhkMHZhL1BycVBRQXpBVWk0bTIwcWxjNEp3V2Y4Z2ZpWVNJUGRsREorejNi?=
 =?utf-8?B?aW85YzVWaHBGN2FadE02enl6VzZzRmZ4MWpuYjUzaE5MVThTZWhoVWJOd1U4?=
 =?utf-8?Q?0nSkxkqZo0/NqCm0KmoY+HYXj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?akFXM3VDbVRicWtmWmwrTlJ4UXAvWXRDUFdBSlRHb2R0RGtIUGticVJjYjJO?=
 =?utf-8?B?dUNVMERMMXBFZ1FmV3JjSHljQzdyeXlvTnNMR3R3dm53aGI3Y2lnL0M5RE1Z?=
 =?utf-8?B?d2ZDUTBLZ1NRVFNLUldiSVRrVWFsUk9mRmFsVGJ5dUIzd0NRdTJrclJ5cDBJ?=
 =?utf-8?B?Z0JkdW83OVhyZk1jOEw1U1pnTGo1cmVhalpzajZJU2kxTk55NnZPeDVLTnpF?=
 =?utf-8?B?YVVTajZ3Wk1GTGRWM3hKWGZ5Wk1ucU9qNGxLeVZMdWEvL05qaHp1ZjFEZWNy?=
 =?utf-8?B?NEdUSXlDcEhqV3M5aXNJcWV5SmJCa0lYS21GZEtvNFJNT2YyMzlJbXEySTNp?=
 =?utf-8?B?M1hvYjZBTWVPSlhXVk9rYWt1dUM1TU9mczVYaGM5U2dqck9Fa1E2MnlrTURn?=
 =?utf-8?B?YkVqY1MwL1FNbG1TVmhEZk44bm9pU1lWUjU2Zk1qNlFhWmVtZGdHS1RrOGgr?=
 =?utf-8?B?NGFxMDR3WW1mUnE1N1JjN2Yvc1hjdmZZUEt5ZmRVUDNydWdXTE1LTUZDUFFt?=
 =?utf-8?B?WFRudHF3VDRENVQxcSs0ZmNFTTR5d05LVCtmdG9DL2RvbXhXN1plU3lNcnE1?=
 =?utf-8?B?ZzlSSkVhamZRQy9oaGI4K1pxRGFjc0NsZTZralZtcmFOMlhJZ0l5SmZhSmxN?=
 =?utf-8?B?b2xJVnlKSDRkVFFpZzI2Mkx0a2VDU0VvZTBTNWxhUmZyS1docXQyWTJ2Szdw?=
 =?utf-8?B?UFo1WTFtbzNRbEw5WTduRWNMK2JEb0JMMWs2U3JDbmZmamprMUU3WXVDTXNs?=
 =?utf-8?B?OFRncVUrczhsWUpMejBVUnVtamtZdHVRT2JBV3FsU1J6OEhKTWt1SGVtd1hO?=
 =?utf-8?B?MXMxU05EdEw4WE8zRVZ3czN4WXpiTzJNU0dwME4xeXEzdWhOYUMvRUhpc2xw?=
 =?utf-8?B?VmplQkJ5alBTbnpheHpnSUw0NXVoNmx3cXNDSzd0UzdEeURvZkp2UnEyR3k1?=
 =?utf-8?B?OTVlMUFDWmtNekpyODBCSmFkcFBWYVdPSU01NXZuZHo2TzNBOGVuRXlyYTVp?=
 =?utf-8?B?NU5XQVFoU1I3K2g3Q2ZEQkxVc1NaNHFmSFp6SGE5V3grYm1RWkN1QjRCNFhy?=
 =?utf-8?B?VVhoMHNRM0lVdmpLbHdLR2NwVmVGRElpUHpDajhSRHR1bURGRnA3TGMxcC9M?=
 =?utf-8?B?cUt4V09BRzcrNXV3TldTZlpwMUFOd0l3a1RKUndNZUlJU3hXUm5PZlJSMTFl?=
 =?utf-8?B?RjZselJFZ1dIZ0ZwcTduQXZPNlhJLzVYRWszakc2S2hIQVBhZ3JSNGlRZGQ5?=
 =?utf-8?B?SkErQ1loTXZUVkR2T0hQdGY5bkRzTjZKalZQK2hDUkU3d01maFpsa1FNVU82?=
 =?utf-8?B?UURSTXlmWjFENjI0SXFhUVlFcVFmUUdKSXZwSExHc001Zy9hdmg0YUdzNHk4?=
 =?utf-8?B?ajNleng3VFRuR0JnTmQrakJINC9LeW5SNHBVVTJLcStRZlYrM3Fac2t2Q1JM?=
 =?utf-8?B?UHoyblVXR0Mza0Y1TlQyR0RzRkNPU3p5Nm5GOGNnPT0=?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723112ee-049a-4c9b-7824-08db208d565d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 10:59:21.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xr7LHE56hkkNyymiMt6ZBNkpYUZugDEzojE1zIbyZ9gtMpahQr74YPltc8mZCOgj2aNARTOlWoYiO1TqHcmwsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5919
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Jan Beulich <jbeulich@suse.com>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

It's been 3 months and no reply.

On Mon, Dec 12, 2022 at 01:36:48PM +0100, Roger Pau Monné wrote:
> Hello,
> 
> Gentle ping regarding the locking question below.
> 
> Thanks, Roger.
> 
> On Fri, Dec 02, 2022 at 12:40:05PM +0100, Roger Pau Monné wrote:
> > On Wed, Nov 30, 2022 at 05:08:06PM -0800, Stefano Stabellini wrote:
> > > On Wed, 30 Nov 2022, Roger Pau Monne wrote:
> > > > The hvc machinery registers both a console and a tty device based on
> > > > the hv ops provided by the specific implementation.  Those two
> > > > interfaces however have different locks, and there's no single locks
> > > > that's shared between the tty and the console implementations, hence
> > > > the driver needs to protect itself against concurrent accesses.
> > > > Otherwise concurrent calls using the split interfaces are likely to
> > > > corrupt the ring indexes, leaving the console unusable.
> > > > 
> > > > Introduce a lock to xencons_info to serialize accesses to the shared
> > > > ring.  This is only required when using the shared memory console,
> > > > concurrent accesses to the hypercall based console implementation are
> > > > not an issue.
> > > > 
> > > > Note the conditional logic in domU_read_console() is slightly modified
> > > > so the notify_daemon() call can be done outside of the locked region:
> > > > it's an hypercall and there's no need for it to be done with the lock
> > > > held.
> > > 
> > > For domU_read_console: I don't mean to block this patch but we need to
> > > be sure about the semantics of hv_ops.get_chars. Either it is expected
> > > to be already locked, then we definitely shouldn't add another lock to
> > > domU_read_console. Or it is not expected to be already locked, then we
> > > should add the lock.
> > > 
> > > My impression is that it is expected to be already locked, but I think
> > > we need Greg or Jiri to confirm one way or the other.
> > 
> > Let me move both to the 'To:' field then.
> > 
> > My main concern is the usage of hv_ops.get_chars hook in
> > hvc_poll_get_char(), as it's not obvious to me that callers of
> > tty->poll_get_char hook as returned by tty_find_polling_driver() will
> > always do so with the tty lock held (in fact the only user right now
> > doesn't seem to hold the tty lock).
> > 
> > > Aside from that the rest looks fine.

I guess I could reluctantly remove the lock in the get_chars hook,
albeit I'm not convinced at all the lock is not needed there.

Roger.
