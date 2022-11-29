Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A663CDB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 04:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMPSC3tFXz3bgc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 14:14:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=YSBqBWTD;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=L2LTG9CL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.153; helo=esa2.hc3370-68.iphmx.com; envelope-from=prvs=3254d5a84=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=YSBqBWTD;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=L2LTG9CL;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Wed, 30 Nov 2022 01:33:30 AEDT
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com [216.71.145.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM4Zf0ZRNz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 01:33:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669732410;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Wh+vv6jzx/wiXLzxnMC6K8zlJzUi+S1gkbHF618lS50=;
  b=YSBqBWTDF1tBuP2N7y3M+o3XI/LA7qyts+qRzkZEPgC2ifvv19lGhzRh
   38NDBqL8TfYguYdDPsNyrarldvs6YlcAOyRO/zVb8ewtqEbO/j7Zev8/3
   I4BkcSmuh6mI6yNDc3XuEnOgamdb+WulrFLp064fkmCsWI0p9wcYlIyoS
   Y=;
X-IronPort-RemoteIP: 104.47.74.42
X-IronPort-MID: 85783463
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GhxPraxsT9CLP1nFSPZ6t+dTxirEfRIJ4+MujC+fZmUNrF6WrkUPz
 DNOWzrUPqnbYGH8KYxwb4S+8EIAsJaEzddrG1c5rCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnP6ET5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxy9
 fIqdwpSVRe41rKEm6DjFrVFvu12eaEHPKtH0p1h5RfwKK56BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDSVkFYZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r827Cfxn+lA+r+EpWyzs5xpWTCyVBQKxcRXGumgqmLiEihDoc3x
 0s8v3BGQbIJ3EiqSMTtGh61uniJujYCVNdKVe438geAzuzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8oim/NisVBWsDYzIUQwwY5dXqvIA0iFTIVNkLOKy0lNzuHTj60
 hiJoTI4irFVitQEv4258krAmCmEvYXSQ0g+4QC/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpl
 HIDgcmFqucVEYuKijeOUc0KBrii4/vDOzrZ6XZtFZQ88zWm+1a4YJtdpjp5IS9BMcECYzblJ
 lDSvQB544VaN3+nK6RwZuqZD8Us0Lj4Dd+gWv3KRt5PeYRqMgiV+ChkfgiXxW+FraQ3uaQ2O
 JPee8D8C38fUfhj1GDuG71b1qI3zCcjw2+VXYr80xmszbuZYjiSVKsBN1yNKOs+6ctovTnoz
 jqWDOPSoz03bQE0SnK/HVI7RbzSEUUGOA==
IronPort-HdrOrdr: A9a23:/ouQ5q5hVuUvZRmErwPXwbyCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfjqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCWF2QIRO/KovzMjdbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlvxxnLe9JNfnfrm059mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIL52X5wVGVrHP/qYihLQhKffZptMZ8SF/0+kAgtNZz3O
 Zi2H+YjYNeCVflkD7m79bFehl2ng6foGYkk8QUk3tDOLFuH4N5nMg6xgd4AZ0AFCX15MQOF/
 RvNtjV4LJsfVaTfxnizxpS6e3pek52MgaNQ0AEtMDQ+SNRhmpFw0wRw9Fatmsc9bomIqM0q9
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnLqcaIHjAwqSHrYnd3NvaNqDg8aFC2a
 goCDhjxC4PkgPVeIezNaRwg1/wqD7XZ0Wv9ilcj6IJyoEUCoCbcxFrc2pe7fdIk89vfvEzZM
 zDR66+e8WTS1cGObw5rTEWCKMiXEU2YYkyhusRfW6oj4biFrDK39arAco7YoCdWgoZZg==
X-IronPort-AV: E=Sophos;i="5.96,203,1665460800"; 
   d="scan'208";a="85783463"
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Nov 2022 09:32:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZKBCbiBTnCEogzgAqYo907pJGWx6+HgXe+ZP7tB8rvm5fEWqmrPxQ48tyOlrn1RZTvP+tyAaje8oLaEfX2Wi6fK4Zj412ZhjPoXuVxHyPj+L64dsqihx3PH0nBprxf6x59TBk8Lg00ttok1ip/65nJS4mirSziuaNGFxtITKAyRWuzsHUA0lXagjVAZW1vKW58dPeLEyHz55tp2i7oRiaqkWyF35cTIpgUBNsQ1tsdTvcxEsmlvY7EfFIDhkYxQtZN0Y9YLONm6wCs3ZaLA44GufPRdev/x2Ukz9KR8/ITppTZXqqdjXgrRsjDK/7oeeKiBMr9YFcs3FycsGhla/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMIcbB390IYiCQeoKixgqUua7BwWYTILvEu0+nRR/V0=;
 b=AiOOum1J87fpNRaAuexpsUv+SF38lNHLAToHOT/tM1BnoZHonCHWgAjTNqS27upXv9R1k0K+tCgVf8OsXQlyuYXgZssmtqluzZ+P9A+k4RuotELtAy+TBomMEYBM6PVOursuQc2gjMwu5IEMeQDtncUTJpYwFOogdNCRLX26/60UeVYzcZ0muQutmcV7L2TmVwtHebx6CKARAxCU+lXW4E6/cJXLD56pMnrDuJytYSOkFliL8KxL4i03ROTzTkKrmnHYxqw5dSAqqOfv/qetUvYYfMN56T3iTjMNDN89PVVUX6hYwMxxV5jjM1hp9fIitzVWaqf9ZujFwgqGvGnHuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMIcbB390IYiCQeoKixgqUua7BwWYTILvEu0+nRR/V0=;
 b=L2LTG9CLAMOc9u5GZr1jozAbAQ9F/42ins68MuD69tW/SfmL1GmA7AdqbIZI3fbbvJrsR93YjKs+Ps39vseSY8byPn2Jaoj+Yc9iOkvcowFqlcYJtByVBKI52501NTT4K3D3ic+eiUmbz0S8vnkAu3jd6jUp69wZMCHfRESp+tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6634.namprd03.prod.outlook.com (2603:10b6:303:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 14:32:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:32:13 +0000
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] hvc/xen: lock console list traversal
Date: Tue, 29 Nov 2022 15:31:37 +0100
Message-Id: <20221129143145.4234-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: cefca828-24d2-42e2-bdcb-08dad21681d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	okwqNcAUnblGECZFShxXgbjuAeRi1jSmkX5kRFBmktWoeBNiTrmqSx0sj4Nipq1ZDHWX2cqEZ8YR/L8/wq37xb3ZBrlaPN/hg/a04BEwHByGY0aU/YkZo+/iS9x5VAAOrLS2eDVoWv+Fb7MBv6ViTfeqeqLed7sNcI3UDRTN7JyHffrA05lSOUa9S2iCEllwAkLmn0zWZfcxyiTC3QExxwjAJvzc4eUf/WPq2S0lhIuCimI+epKbJFLHg8xr46YrLJ8nh9vg2c0kAJWwKmNPz1HHRIolOct5uIbSBAuaDYtEFqYmwX9YxMd+6sJSgd9KHBx9pfQLGNosEtC6GQxkaJl95EqES5e0z8J/QsAKptwV3tbP3s9gMV7PUeputObC2/884RWzfIyyuW3z9gHxt/UVJLaob9k7zxUBn/zuvFSsJbVItTCNHGhzkkbe92o1z7mtG5zBML6TFWl4KsWviK7eUXzzsvNdghyCAG0zB7MAbkyTynGPzS7MXUL4z6ToNpb1hUwDDllcdt8TG4vS8cTuzkE9bS6s2nLP1z8SdW0wJVYTV02yvFaGpyBibpCMQKFThe4Hgm2LCYtB0qUuyVfjlJoccE41sv6veiSgEez7qg5JiqP/sMFlm/F1kPU9YzDZQW8IX+nJZOKZmWIkIA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(66556008)(2906002)(82960400001)(41300700001)(7416002)(86362001)(83380400001)(8676002)(54906003)(2616005)(1076003)(6486002)(316002)(66946007)(6916009)(36756003)(478600001)(38100700002)(66476007)(4326008)(8936002)(5660300002)(6666004)(6506007)(186003)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?czRWbHE5clAraDRIb0tIOUJ3Z0FpMEZNSHd3WTQyeTBEZzNDbk04Z3Z2V3pW?=
 =?utf-8?B?dVRTRkNaaG1Mdm9yUWFYUys2LzlFR3NhakJ4NTU1clBNbngrRkFIR0MyakJD?=
 =?utf-8?B?Nm5BemNkeDViUXZ4b1FtbDZOa2swZFUxTUtBYTVyM2VJUFRXcmN6UGkyaWg5?=
 =?utf-8?B?TXZHRENjT2N0VncrODhOZzdDQW85eVg5OHBWZ28za3RSeTk5NlJTNjdKU0hE?=
 =?utf-8?B?WTF5dEo2bUJKSEJQZ0pxcTZ5T2x5OFZSb1NuRDc0VkliYUhNendEUllSSjZp?=
 =?utf-8?B?eVExT0MwcWRKajFlMzVBcUI1TjBxbFpCNlZIMXdpSkhZZ3JxZzdmYjdFa3Mv?=
 =?utf-8?B?OHYxTm02NWVOM2ZieUxWSHBEenBzZ2ZhNzZzQitTaDlXKzJrV21iU1Q4dTUw?=
 =?utf-8?B?KzRHRktQMUd6bUQzZHU0RXY5WmUvY0JKempOUi83SjFaZFpVMHAxLzFPdFNF?=
 =?utf-8?B?bnFoaCtVSElhWGZGUGUzbGZXTXF4QVFFL3A1MVpsYWFNTkpGOFRuUGtVRyt3?=
 =?utf-8?B?MkF2aWU2a3FiMWJ1UE14R0tPMUFuQ0ZvREk3SHp1NjJBUG1IUlpIY2hkczdo?=
 =?utf-8?B?NmZocXZnUHZpWGZFYmhTeW1LTDEyTitBSnc0enlwVDNtRE5GYmcrRmhMa3NH?=
 =?utf-8?B?SytjRERKMmdNai90cHhuaUpkdUpKay8wbERWaXYzUHBXNjE3QXIxK1hpZ3Qv?=
 =?utf-8?B?YVRWUHJOdncxQVVFQzUrUHliQ0V1dFNmZHRRMmY5OHcrZmFVK3BmMUlmZ2pT?=
 =?utf-8?B?UU52MkZFR2JST1UzMWI3TkJlb3ZVQVRGcFhQYnNUbHNHNEFaaXlJSGVqKzRK?=
 =?utf-8?B?SmJYRVZIM0pZaUFoQ280ZW16Uk1kdkRsZDIwaGVIWVdBWlhCZ3NEbnQ4SjVZ?=
 =?utf-8?B?WVBmbHRFaERwVWtzM0hMN05OSk00WHMwaGdaaGZGWHYxa1g2SFZobHppYUk4?=
 =?utf-8?B?U1FGMFJSTjhLdzlnT0c1ejNJcEJKWXZBeTJCTUNhTUVDQUhHTUtuQzVnaHll?=
 =?utf-8?B?YXYycXlCNDV6Z0pDSWZFOWVPd3A1dlU1dTdqN25QYXNueUFBZjI2T0NQbU93?=
 =?utf-8?B?NGluOGkraW1WaEFXRzRSeHJEaGJ6OEZ2S0RDOElJemtYcW94Zm1wZUc3K0FM?=
 =?utf-8?B?dFBGS3dkVWFYcTZWRDZ5V1hLaVozeFpSeVBPWVRnc0FjeUVnMGsrU2FKYjZs?=
 =?utf-8?B?cWkwV2dEL21ra1JvQWVwWnIxV2xiWDlnQm5UakZZaTkyRndwSUlvcFZ6RWUw?=
 =?utf-8?B?TzdWbk5WV3IydHBhVjZITWF0SVh1T3JDbFhGWm03UFRMbCs2c05tSzNNeW4w?=
 =?utf-8?B?QVNrNzMydXFHNFg0ZUhnSElOdk1TUEwyaTdtQUVCeTZXaS9FbXJ4RXJleDhW?=
 =?utf-8?B?WDBjdG14aXh1VEJKdCtKMlg0bHJZOHgybGJZdmgzVkcvek01RmhUdkhrMTBs?=
 =?utf-8?B?RGwyZk80VFlZa0Y4cXVCekQzU0ZEcDQ2NTkreExDb1pqK1dnUk1JaDQwS0pQ?=
 =?utf-8?B?Y1RMcUZnNGpOMVd3WDRlQjVld3BFamQvd0Z2MnRGRy9HeFByMmMyVkgySkJa?=
 =?utf-8?B?TzhvU0NMY1ZHenVqVHRzeWNFVE15V0tBYjB3SUNka1FObllzNWkvRG11dzMv?=
 =?utf-8?B?SFBSQXZDQ09TUkRQVDRzeGhqb3lzWjloTHl6UG0wNlFSdmZZVTRXWkw3UE4r?=
 =?utf-8?B?VFJqOEJJRnVGOGJxd2RId1pvSjdhSjFHVVRNSjNKenZuMWw0MHRkZ1VNOFNz?=
 =?utf-8?B?d29JYjNuMUFGS2pUNlFNbHErVW1odlFhN2FlVmFRMFIzTW1DVHZFaThpQ09D?=
 =?utf-8?B?M1JWZ0lrR3ZPb0c0Q2FFNXFyK2hFWlcyRmR1R0Nhbmk0cC9jT2hQOUcyU0h1?=
 =?utf-8?B?L3BNWnFEc2prRWtZanZJcUhYQXRiVTQ4TFlueTRFMFhHTGJNUm5Ec1pJVUEz?=
 =?utf-8?B?N2VCK2tYK1J3b1N3SWF2ZmIrOXM4Wmw0bFppeFRQV3ZlZnpSblA0R0dTMC9R?=
 =?utf-8?B?UEpGVXd4bnFzeGI0OW5FUFJUNVB0WEM1YzJJeUthNzVDMkdNQklUWm1jMzJD?=
 =?utf-8?B?OGhoWXFsSmYrZk5UUURuSXNZQzNsa3ZyRExPNFlyRFFzeEtVVHdUNU9GdVRM?=
 =?utf-8?Q?OvSO33DP9Mn3Povhogwv59B7r?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?cXd0bTR3dFhTV2ZFdEhiRDBZcUx6alJzVnBMMmdtNmFyRWJEZ1pIWWJEK1N1?=
 =?utf-8?B?RWxVeDE3dTB4aTBEOW5tZXJPeHdjODIwM1pMOFkwVFhkZVl4Mi9nVmJodFVs?=
 =?utf-8?B?bXhjY28zTWV0QjZ1SXZTZUhic0sySWFRclhKZDR2aG81Z3pqeTlJMEM5MVhF?=
 =?utf-8?B?VExhTWhWbENQU2JLdzF5ZGxNazJRU0NMYzBKTUJzalhLWnV5MjlCVWN4a0FL?=
 =?utf-8?B?Ymh3S2FZelZNekRJVmtTSDFJb1JMRFNJM0c1MmMwdzZIUGVQZkJxQXBUcHk4?=
 =?utf-8?B?SG00RjhneWREUUdOMXZQQmJwVFFtK3pLR2UxTk16RkhVazRseVNxUGtKQmxR?=
 =?utf-8?B?RmdERENvOWtXcnJXajNDcm9TSy9SRkQ5ZVVtYlhQQ3RjV2dhSkxRa3NUVHhw?=
 =?utf-8?B?VEtYSmFmVFhualMrd2Rva09hWkNVYVRsODc4bVZrUGo5YVdXUkRQa1lUZ2V1?=
 =?utf-8?B?WHZkR3VJUGVydmE1SnF2OTFJSjZyRGtyaUpjYWxNa0VPQ0tzSG1IeXppU2lT?=
 =?utf-8?B?SW5EVUtXcFNuZW1kTUZXOFl0SnN1dWQzUUtvakdxb3hnZ3hZRjNNdW5UVU12?=
 =?utf-8?B?T3pYcGVIUE9tdWpDV1pVNVRTTFFHcEFyMCs1MjBtU1pnZGV0WHM2RHJUUUdp?=
 =?utf-8?B?Y3BaWmN3NWEzUVNkU0hwQ2Vmbi9Vc1UxZEZxSDhrZGlFajZMbUUra1NOVlpj?=
 =?utf-8?B?OE5ad1dFSUhKZUMvUVRicTVzUUR5aDJqbGI5SDAzRUo5Q1BaczI4ZDVWd1Fv?=
 =?utf-8?B?ZVlZcEJ5MW1VQ2xDQzU3TGlZK1QrcU9jdHNCMG9OKzFOV1JUamVVcXN4UkR3?=
 =?utf-8?B?QkxPYkNSNW1pUElmTHZVSWFMVmIxQmdOdWoxbHM1NFJva1B6SDVkMGhLMnZw?=
 =?utf-8?B?RjFkQnV6TzNXZTFzRmcrcEltejFXVlAyaGZwTkdDVFM1RENOeXdIZnltT0sz?=
 =?utf-8?B?ZC9ENkNQNEVmQW5QblJQOUpIQ09EemhLWitKZGR1SzZjVGdHb01sSXA4RlRT?=
 =?utf-8?B?ZzEwWjFCTzNORS81U1FxQVppekYycFNXNmhVWDlpVGVyVi9aVkxrQzR4LzVl?=
 =?utf-8?B?RFBnV25yZURSMGY4WlhLREVudkNrNy9Gak9NSjhHd2dCaEFYT0tjcG0rMmcx?=
 =?utf-8?B?NDRmQTdQN2xXb0owaDVDbzJnNGYxMDI3N0Q5VW5RRHhselFSc1pWd3BaZnpD?=
 =?utf-8?B?Y2xhZVFEVkNjRDIvMW9PSXZtaW5jYkl1OG1OK1VNTXFOcFNVN2pPVHpvN2py?=
 =?utf-8?B?ZUErTFFNTjlSZWJ0eWFqUDk2c1E5RHlHNkh0R0daNklwV2ZCYlJBNlRrcHFR?=
 =?utf-8?B?ZmVQekQyZHBKUWdlZEY2OU05NlozQTBqYnN0MXlXanRsazcwMTNST0kwWGln?=
 =?utf-8?B?MTFKYTRxd0lIUkhNU2pPOGJoNktoaEllUjl4aCtJYTF2Y1dObmFMR1dIaXBp?=
 =?utf-8?B?bFRkTW1GRitUcjNwa0FxTjgyWnRZcjZ6V2lVSmZRPT0=?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefca828-24d2-42e2-bdcb-08dad21681d1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:32:13.8739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSuaPifVgTAUQTAwofZVKMDdVm1w0La5520lMfXK+398SYBh2VpCH8TaKd2RSJGG/atcnG2hTl5B9TWVWRcZ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6634
X-Mailman-Approved-At: Wed, 30 Nov 2022 14:12:19 +1100
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The currently lockless access to the xen console list in
vtermno_to_xencons() is incorrect, as additions and removals from the
list can happen anytime, and as such the traversal of the list to get
the private console data for a given termno needs to happen with the
lock held.  Note users that modify the list already do so with the
lock taken.

While there switch from using list_for_each_entry_safe to
list_for_each_entry: the current entry cursor won't be removed as
part of the code in the loop body, so using the _safe variant is
pointless.

Fixes: 02e19f9c7cac ('hvc_xen: implement multiconsole support')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/tty/hvc/hvc_xen.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index d65741983837..117dc48f980e 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -53,17 +53,22 @@ static DEFINE_SPINLOCK(xencons_lock);
 
 static struct xencons_info *vtermno_to_xencons(int vtermno)
 {
-	struct xencons_info *entry, *n, *ret = NULL;
+	struct xencons_info *entry, *ret = NULL;
+	unsigned long flags;
 
-	if (list_empty(&xenconsoles))
-			return NULL;
+	spin_lock_irqsave(&xencons_lock, flags);
+	if (list_empty(&xenconsoles)) {
+		spin_unlock_irqrestore(&xencons_lock, flags);
+		return NULL;
+	}
 
-	list_for_each_entry_safe(entry, n, &xenconsoles, list) {
+	list_for_each_entry(entry, &xenconsoles, list) {
 		if (entry->vtermno == vtermno) {
 			ret  = entry;
 			break;
 		}
 	}
+	spin_unlock_irqrestore(&xencons_lock, flags);
 
 	return ret;
 }
-- 
2.37.3

