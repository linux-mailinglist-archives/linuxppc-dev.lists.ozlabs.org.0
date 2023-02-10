Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7FD692E41
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:12:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDHHR5wrFz3fGW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 15:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=vohLvL80;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UumIRFoh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=tom.saeger@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=vohLvL80;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UumIRFoh;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD4mQ0YhPz3f5w
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 07:17:57 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31AHwoWv001714;
	Fri, 10 Feb 2023 20:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=ABLj331Ezg/GCO8xy3OwaT5wo82x5qGQKkD/daFf3Y4=;
 b=vohLvL801dILuXbNWVvvjdWeZjT2j9Qg6HHOR6xyKP8o2Tr6j2wvvj5LkaQbhoEUYczO
 RSWuEra/7YVgg6KQhOR8RVpZU4TaHnXrGJLHd4hKrR2ztHiyvb4uiIO0vkULFLFkD1yZ
 3ZfZkztPnHg0taFU5jhqY80QxgcLJWf6+TD8i/yNzZELr2To9swRfUsL/sfgGfB/H5jx
 J5idh7DXmEw9OmTYLcjOalsXVMcrzuOP4yWyifJWoH18eRoJNYT96X8HbJGZ0/RpI0kk
 ZyFc0DPfvkd+z1x0Q4BcYLtS5FZyDbVfiuaIGgmDP4tgYQktp9WjEVj5crjBcRl8e/uy 4A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfdcp8vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 20:17:32 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31AJX5wt015178;
	Fri, 10 Feb 2023 20:17:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3njrbf8n57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 20:17:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEKpCNkU5Z5FpTNQBOra8e8+8ws9c4pyOgGDost0Bt9whtUOUrOS/nkHUpwWIcTenzhwqGERTov6h1wWtBiNNWiTYguS48aASMeQ7GYAO89ulSMWXyfTw86/pZ9S54NUYhDwgsqhcX8WOus8WSAy25rHlXQeymr2WzeS3oiHSptUVhx0pA5AkSPDAbbuB6LY18mXd3z+6TryR/8hTGNeWofEcMK3TneUdynurQXutJtQytGlnXutLO5tGiwDacwYMqrJlxS9pyA/XZyjSIf5Ec1Dz5/qvYRTySrV3d7f0md81WCbObzKoTJJKt6EdPR9/la6lX9fOby75EtlV352GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABLj331Ezg/GCO8xy3OwaT5wo82x5qGQKkD/daFf3Y4=;
 b=C8DbsqCaYvskQrKN+0KY9Hik6Mj2SKFzO3f71sEsaXvXZM4N6kI4WJJKaoIhgC1eRjr/Qwltw45wK5PZdRKENo8CTi4uGjkgdEp01Tye/rCwWY9qZvynLDPxxpEWCq9b1nMAim9X8XBUcp/bZkLMmCokJkilPaBAZArtgCIA1QBOy2qpLDf+1pqyrlqptdQI2teJ/vwtGQtSxtNX45vud9MgNYts3uuSJDHr4eCdlvXX7zxtrtDnwvuBMtXIlEoZ6JHrrACo12DoeQKIvfpJbPBXVNkM3JVAvfuhR4ouaUI2iQrh30KWL4W3SVOzWO89i7ZRb+5ZzOQLWswk320Lgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABLj331Ezg/GCO8xy3OwaT5wo82x5qGQKkD/daFf3Y4=;
 b=UumIRFohOeyMYzJoVgFVLY38XH0Dj0TuSXUCVoziMEACaaZKd9BYePixWpTKPP+tVwoTwTXRE2eJ12oiPNarjljMy8PH4ez4fDSK9wOSMF2VPoYNDGrjV9LJTYze6c6VT1sAjuC/x9E771O2bAaKJyPRfGCSMfbVF1eNjV/uvaE=
Received: from BY5PR10MB3794.namprd10.prod.outlook.com (2603:10b6:a03:1b2::30)
 by SA3PR10MB7093.namprd10.prod.outlook.com (2603:10b6:806:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.7; Fri, 10 Feb
 2023 20:17:29 +0000
Received: from BY5PR10MB3794.namprd10.prod.outlook.com
 ([fe80::f37e:ad45:7d9e:d84d]) by BY5PR10MB3794.namprd10.prod.outlook.com
 ([fe80::f37e:ad45:7d9e:d84d%6]) with mapi id 15.20.6111.006; Fri, 10 Feb 2023
 20:17:29 +0000
From: Tom Saeger <tom.saeger@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6.1 v2 0/7] Backport Build ID fixes
Date: Fri, 10 Feb 2023 13:17:15 -0700
Message-Id: <20230210-tsaeger-upstream-linux-6-1-y-v2-0-3689d04e29fc@oracle.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0049.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::26) To BY5PR10MB3794.namprd10.prod.outlook.com
 (2603:10b6:a03:1b2::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3794:EE_|SA3PR10MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 382e7c18-37f3-43c3-0295-08db0ba3d576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SvbrgZob4ZFweF4fykQrHhN5JYiLQt/si8UyEa0oVsz1cPLy/b59Ms7eQy3MC6c1U0pgruQwbleCurL61ikGer9nH4L8Dd4kHP3N+hrSad8y+7BreoyN/FE0cX+UP0/nPlRfNyFMP4LTYht5u5HurweGZgddBE7OdLqJC39Uvz1JzBhy2z6QwQKBs7s2lyP3nJoCWq8CYzgnqIPLGKmtIbZnKcGR366J4FRMe90kMveqGFYDRicU/jEm0ERdutUQZSqesJ9nqQhjDYoLqfjznfY+8CWeITJcYukIiG2gPvhq+M6bc8Num86QAb0+5O/58YGGSVlWcIIq2m1UUvByIkcU8q8oECZlMR3NAPFmci57lZIt5tzO7BgbtSc1AVtRIHOxuuPrU7OmygVhxWJPT83Qp5aU7k84KC/ef1I/rY/iiCdUo7OmUQdPlA+3z30BE5/hre8mTD1059UG37ZjKuGkNK/jAV724WARPwO08yk096lqiCVjXgtewfhHyYtFnB7Vr3CHNFtcCNL79l16AZZsKoFbL1bRaFEQmU3dsRXTK3LLuVUQ8AIHpUu604ope/9nz9ghC1MFeZxqPEcawUEI5N4dZaKfFuZm9tuP5+xa9oMet5xV1eY9Otk6kn8aIRlbyIejA3zQH2RotSvTqa/yQ7+JHnnhqukHRNeog4w8zWrMV4o8lfivKxSGgmqqfXigMVfoLk7wvTfDh/7ySA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3794.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199018)(44832011)(6506007)(5660300002)(7416002)(186003)(6512007)(8936002)(36756003)(83380400001)(86362001)(38100700002)(2616005)(2906002)(316002)(54906003)(6486002)(966005)(478600001)(41300700001)(6666004)(66476007)(4326008)(66946007)(8676002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bXpSNGxLeEtoM2cyZFh6U3d1VWNCQTNndmZUUG1MYlN1Ry9vc1BhbXNQS0Qr?=
 =?utf-8?B?cmlLZW0xUGRWeFB5dVl1VVNpRG5IYWU5aGFaUFRkZHlzRjdUeGl3SlJaVDZM?=
 =?utf-8?B?ZUJEZDAwSGIyNHJTTE1xOXRERlVEUmdDVzkycFBuR2JnR2JhaTRTWGtPejFz?=
 =?utf-8?B?aGRpSC8zSjFoMDl1dERrekV1UXNlUUlLWm94MzFvaHZsQzdKR09SM2tHTUNY?=
 =?utf-8?B?ZzlnQ1k0THRUUVpUWndKaVpVOVJFazM1Wm5TMFdDejlPY0NiT1E0dlcrWUo3?=
 =?utf-8?B?UXdicSszYzU0MThVVG03bGU1UXRKM3lFV01GOGV3Y2VwY0tJSGlSOXlNOUNp?=
 =?utf-8?B?OEIrQ1JFZmRtTXIzMDRaYkV1c3FUMkVLQmQvOHkrUCtnSlRIZ1VsWmxsM1JQ?=
 =?utf-8?B?Vi9COUd2VFlBeFFESXlJei9iLzFTcVN6NXJrWUZNaEJWZ1ZzSnVGdTV3OXZs?=
 =?utf-8?B?VmpEYWQzZHozMXRxVU5nNWVqN2JVZUJjSGUraEEwc29GS3BQUXlBak4ySEdr?=
 =?utf-8?B?YndEeUpPbURnelJhMUU1NjUwQVBlMkxKNEFpemxnTk5aV3R5Nk1EYVpCRjNU?=
 =?utf-8?B?Y0h2R2lvaWIzWU5kbUdhY2JMamF2bFJVQnA5amxZSHYyVU9qRkNLUTRTUzBC?=
 =?utf-8?B?K3FRMC9WZU5heUJwRm5iUmpWV3NEODlFY0x3MENNZkFTaVd3WWdEN2h6UDdM?=
 =?utf-8?B?NVNENkhNa3poMytSeWVOMmJxaVU1TEIvTU5FRy93Q0RhcnBMQm1rWXBzekdG?=
 =?utf-8?B?Q3c2elVLSHM4dDYxcEtHTzR6YTh2N21odGl1SFU2OHl2dml5MzRxTkh0SzJW?=
 =?utf-8?B?bnJmNnpUaTcvdEYxNloxd0pZbTRRV1BldmVVVElMWXVnK0ozUHYxV25iaXR0?=
 =?utf-8?B?dTNFZEdMZzNXUHAzSi9YQTJHTWFwQmZVeE5jK2hhUm5nUWN3bDlWQTFHditr?=
 =?utf-8?B?dHltRWkzQVc3Y1hPVFFTRWRtRHgxbS8xakdZb0tDTEFLZUlCRkxRaGxXR3BZ?=
 =?utf-8?B?RjRiTUI4QmFqdEFvanhEUHU0Zm5GY3JOQStkY2MxMjVhMS9uUkV4WS9ERkpu?=
 =?utf-8?B?eWZwOTUybS96bHNuZ0NnYkRKcVNmM2lGc0FFY1ZXRFNvWUhNdVpXTWVmTVV0?=
 =?utf-8?B?dWtRRGNkUGoxZ3FIeVZKRXluMytvL3NBaVBzTWRpbHlvdjVHSWdzU1RwbGQr?=
 =?utf-8?B?K2d4UnVBdXI5eUgyWWVBeWdndEJFT3N6ZmFEMG5BSkhPMlJ0YmdYQVZoUzNo?=
 =?utf-8?B?YVJsT2lzd3lNWW83NWpSWlRlY09PNy9Ray9FSnNPOFdqMnV1T1A2SVFXUVhL?=
 =?utf-8?B?M3B1bnBqczR4SWtTUTdUZWE1Znh4eW9pamVDYzY1SE1rUW9PVFAwZE56UDhQ?=
 =?utf-8?B?RVl3Y3I5dHo4SThjSC9LZFdZakd6K0t2QVM0blRua0dOSTg2SjlJUDVZZTg4?=
 =?utf-8?B?R3FUNlljcWR3MGxXTUQ0R2dPWUhtTDN6YWpVR1FQTkJ6RlpBYTdQZExnYnQx?=
 =?utf-8?B?cEVUZVYxVmRCVnBROVNEcGZTRXJFV1ZqTUQ3azMydml4TERXL1FxWlNSemR2?=
 =?utf-8?B?VE10eE1WMkJ1VUFFZVo2M1FaSERVYmZxb29XNysyMDV4ZXRBWW1sVExaRlJE?=
 =?utf-8?B?T21pd2NpU2RiY1lFRzNza1J4aElxcXFuYUtGQU1BRG9tYTZjZXdic0hyalk3?=
 =?utf-8?B?NWRIQ05RTFNGZGF1cS9KcThpR1ZWTG52ZGFWS095Vmc1L0l2RlF1QXFXd2w0?=
 =?utf-8?B?WUdONm4wejFraGF0bW5aUTh1QU16b0x5WkdtcnBhUmZ2VzdVbzdGeDc1R0E0?=
 =?utf-8?B?S3NiTGpGM1JnT2s3cjN5SzYrZFlHNFB5S2lSQTVMUVNSNSs0UEpUbm9lWmlK?=
 =?utf-8?B?VmxDUnhLZmxSN0hZaGh0cXh1UVBJQVlHeHI5QUhBWWR2VnZOa2tzWnI4cWZD?=
 =?utf-8?B?SmdyWXpONDl0NXZyRTZJcy9ZbHd1UnVURHRwRlNOaEZqQTlZMG1CTGMrTmZM?=
 =?utf-8?B?Y0JwUEpLWjBFU0syZTZac3pubDkyQkloR1dTOGFQVGs0WS9pNXREU1Rka2Ix?=
 =?utf-8?B?VEVUd0pMYU1TRExsd3ZuVmd3RGFoR1lESHk5WTNKWDBLK0IxNERYSlZiYVRs?=
 =?utf-8?B?dmFqTFYwcng5WXZlTE5QMXJrV0hmaW40ZGpINkdXTjlMbWF1UnpwelRKeHR6?=
 =?utf-8?Q?QJbKupm+jgfqo8LQnmaSDbo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?aTRHRGpBcHNsQ3FML3hNMUxGcDJWRjBzeXR2STROWkZXZTFoenlTSWMvUkRZ?=
 =?utf-8?B?a25CL0J4V25wc0xtY2xvRVgzcmVWeVV0bkdqYjRhRlRJdzdXTExTUVZnSTVs?=
 =?utf-8?B?aitmNlF2aW9JaldDTDJCWjhkeVVHTEZMZ0pwbkt2aU1GRUd4ZEZEQm8ybUMz?=
 =?utf-8?B?cjhTQUNqSXdmb3V1YTdEb1lFMThyQ29xZ2hQbnFobVVkejBRTHBoZmFRUVVS?=
 =?utf-8?B?bkloQmdqUmVYREs1eWtDWjIrbGR1L2E5WFFhU3N6d2NGNlg1djZxZ0dFN2ty?=
 =?utf-8?B?OGMvWjM4WHQ0Q3JBZDJYdzZiL2NvK1htMEF6SDR4anI3M3RRWldvajBUckZv?=
 =?utf-8?B?TFpUTTMxMXBRSUpPV1RCVEp1WlJnS010dVF0Umh3UCtDR0JpQVNMOGZmZVVk?=
 =?utf-8?B?bUNXcTVPZ2pIelNEVXlmM2ZKS3BGQUxON1dNWUUyNVVGOE93QkNsVnNmUW41?=
 =?utf-8?B?djBzTFBqclZnUTVNdEFjU1BRTFpzbk5GbE4wcjFjVmJQZWlvSWZpRHpjQ3lO?=
 =?utf-8?B?QTJyNStwNVJsRGwraFdkNTZ0YU9aVFhFdGhTOExsMUlFYlg0aStKc0YyQjZY?=
 =?utf-8?B?aWkyZFNnejVDbm1xQ3RwUkNpYlhBWkVycFBlZVpXZ1hFM1JSUEc1TkVyVjBn?=
 =?utf-8?B?MC9PeDNNK2JyanV0VnROdVBjKzhiQmRmQXc4eHVRcVZ3WHBodWVtMytLZk9S?=
 =?utf-8?B?V3NyMFNyOTFlUGJnUk1JQktMT3dBdW5jdnpnTFZGSW9lTGpmTDN4SXNHT2xp?=
 =?utf-8?B?OEd1VVlHQmF6bHZZSTBDcmVxekNFVXNnZEUzTXhEZUlLTHlvcllNQ1o1Q1Fr?=
 =?utf-8?B?RHNIbk1zQ3Z6bGtUNlllUiszdEUwZkxjcXVPVTJMZlVteEJSUDBzeUhjZXFk?=
 =?utf-8?B?MkVTdWdKZDdZUG04UWZzU0F1RFJ1MmR2VE41c0E0eWRMN0kxdUVvQlF1cTZZ?=
 =?utf-8?B?VjFObk15RmhRYkVSVG1pT21ua2VOS3p5MjZyWFVYbEtnLzdFZkJwampNU0NN?=
 =?utf-8?B?UW5QRDhOdk5YYy94N2R4TWRTUU1DS3BBSWFJVXZNSmNjbmV5SGU2UzFqYmVT?=
 =?utf-8?B?cjdQcHYxRE5QMDI3czQzWGloU2d2d203YzhycEdZWWtmc0xhd0k2UzlqeVJz?=
 =?utf-8?B?VjVGODVRQys1ZWFSN1lFbG5SbUdQM3Q1OGpFVGovZzBPcTRvR01OdUZzTWR6?=
 =?utf-8?B?aGdsS0ZWMzhibmdQSEgvQ1Z6RUcxMHB0Q2JkZUxCNE5KTFRYWHpRTEhDYkhm?=
 =?utf-8?B?R1ZpUGtqdFJQQWJYQzdIYWc0TlpwRFB5R0dMM1pWV2NBUEVtUDA3b0pOZUp5?=
 =?utf-8?B?aG9naFIvTkhHWjg1WTBaNWFydExQQ1dwODkvaVdpTW9PcENOSkZuSmluMUJD?=
 =?utf-8?B?dVpiT3pHc1hrUDhzTnJ5allUWGZoTVYxRVdTUGJyZEkvRnhjT3Z6QitBUFNQ?=
 =?utf-8?B?Z2pWT1JMMmF4U2xVUGxOdUdwODFKYUdFakkvN2p5NEFIb2dlamo1cjl3c2ZV?=
 =?utf-8?B?YytpQy9VZDJVRHA2ZUMweFRkbXlCMWV0eUhDNzhvNE1GUHFYb21Vb2NWdFVK?=
 =?utf-8?B?elZGbUwwZUd4L05ISko5TlJYMVhhRVFZalYxZE5HRkNBM3Axalo5bjcxYTVC?=
 =?utf-8?B?dEh5UXY4VlY4QzJDQitPa21lWHZVWmtPYjYxWmVzOURqSlptSWlwVzFFV0Jl?=
 =?utf-8?B?Wkk1WXdLQTAveW8wd0hzd3M0TEJTVk8xU3h5NVJ5ZjlSTkdvT1F2U2dOWnJn?=
 =?utf-8?B?S2dUL3QvN0NsdGgzSC9YMStGbkVIRUNldXVoeEJTNnRPZDZWMERveEhEWDFP?=
 =?utf-8?Q?a/ydiwpWRwwH0mRJvQYFeb/rchhVWhelRGxVE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382e7c18-37f3-43c3-0295-08db0ba3d576
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3794.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 20:17:29.5193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S47LFMGWvRTm4uK6AhTfjlhn8qZwgCSAijqk2/gMirEh0Za7s5g+9oDbJEpUhtbWldUAnNdmBcmavSxpAABrRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=929 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302100172
X-Proofpoint-GUID: UJkmC0I5Uk9Qmw-Shnh-zX9uXEwWkHZe
X-Proofpoint-ORIG-GUID: UJkmC0I5Uk9Qmw-Shnh-zX9uXEwWkHZe
X-Mailman-Approved-At: Sat, 11 Feb 2023 14:54:09 +1100
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
Cc: Rich Felker <dalias@libc.org>, Tom Saeger <tom.saeger@oracle.com>, Palmer Dabbelt <palmer@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Dennis Gilmore <dennis@ausil.us>, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-sh@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Keep 6.1 in-sync with Build ID fixes.

I've build tested this on {x86_64, arm64, riscv, powerpc, s390, sh}.

Changes for v2:
- include 1/7 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")
- include 2/7 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
- rebase  7/7 c1c551bebf92 ("sh: define RUNTIME_DISCARD_EXIT") from upstream

Previous threads:
[1] https://lore.kernel.org/all/cover.1674876902.git.tom.saeger@oracle.com/
[2] https://lore.kernel.org/all/3df32572ec7016e783d37e185f88495831671f5d.1671143628.git.tom.saeger@oracle.com/
[3] https://lore.kernel.org/all/cover.1670358255.git.tom.saeger@oracle.com/

Signed-off-by: Tom Saeger <tom.saeger@oracle.com>
---
Jisheng Zhang (1):
      riscv: remove special treatment for the link order of head.o

Masahiro Yamada (3):
      arm64: remove special treatment for the link order of head.o
      arch: fix broken BuildID for arm64 and riscv
      s390: define RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36

Michael Ellerman (2):
      powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
      powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds

Tom Saeger (1):
      sh: define RUNTIME_DISCARD_EXIT

 arch/powerpc/kernel/vmlinux.lds.S | 6 +++++-
 arch/s390/kernel/vmlinux.lds.S    | 2 ++
 arch/sh/kernel/vmlinux.lds.S      | 1 +
 include/asm-generic/vmlinux.lds.h | 5 +++++
 scripts/head-object-list.txt      | 2 --
 5 files changed, 13 insertions(+), 3 deletions(-)
---
base-commit: d60c95efffe84428e3611431bf688f50bfc13f4e
change-id: 20230210-tsaeger-upstream-linux-6-1-y-06c93fbe5bc8

Best regards,
-- 
Tom Saeger <tom.saeger@oracle.com>

