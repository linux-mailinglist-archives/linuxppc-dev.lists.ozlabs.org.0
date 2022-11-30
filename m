Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3763D8F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 16:11:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMjNY28wwz3bgj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 02:11:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=QBd8mVMn;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=ugTRHSsa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.155; helo=esa3.hc3370-68.iphmx.com; envelope-from=prvs=3264ca9f5=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=QBd8mVMn;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=ugTRHSsa;
	dkim-atps=neutral
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com [216.71.145.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMjMW5yBJz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 02:11:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669821063;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=yRZuZYESRTpPHJ5S0tLdmAUG8W1yOwAN/mIDBKSAHgo=;
  b=QBd8mVMnVttYLKPQgDeQQ8DVGdWF3aImkBMMjZEQ+3WnwVOoEuJ2+9WL
   W5CHwfIoYjotAFkhJOn5Z4J8nN0TuNr5a/EVe1ckQmI+Cuc12ByhhVk9D
   w7G/0VkdAKSaheazR+KHdo3G6STlj8aw1cs3gzfWC6MGj0cuy9uQsSgxe
   E=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 85866557
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8F70CaryVtnMDWlj9TV6lxdbeydeBmJjZRIvgKrLsJaIsI4StFCzt
 garIBnUPv/eMDbzKYp3b9+1pkoF7cXRmN9qGQpvpXo3FngUpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzCFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACkNSQm8uaXs+ZiYGutrhON9C/Tue4xK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTCN9CSuPlq6ECbFu74StLLSwwFniCiPiohnXuZe9wM
 WEI5X97xUQ13AnxJjXnZDW8oXiZrlsfVsBWHukS9g6A0OzX7hyfC2xCSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BWAYaCAHTSMB4t/+sI80kxTDR8piF6jzicf6cRnyw
 iqLtyw3jaQ7jsMR0ai/u1fdjFqEpJfTSRUuzh7KRW/j5QR8DKanbYG17VnQ7d5bMZ2UCFKGu
 RAskc+E7ftICoqRjiuTW+YcNLaz7v2BPXvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBS
 ETTowJK+7dIO2axKLRwZ8S2EctC5a3hE9vifv3QctcIYoUZXAiD+y9GYU+A2GWrlkUw+Yk7O
 JGGYd60BjMWBLpPyDutW/xb1q0vzyolg2TJSvjGIw+P1LOfYDueTu4DOV7XN+Qhtvrb/EPS7
 spVMNaMx1NHSuribyLL8IkVa1cXMXw8ApOwoMtSHgKeHjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:wN1koKmTrUoItLas/FvBjALTOpbpDfNYiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhRYtKPTOWwVdASbsP0WKM+UyFJ8STzI5gPM
 RbAtVD4aPLfD9HZK/BiWHXcurIqOP3ipxA7t2uqkuFIzsaCJ2JuGxCe32m+wBNNX17LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGi8zXmIngaRsmAQdizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATtMr9xsBFDMmsjNFQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l4dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdpXf4u8T2SB8zFsIE3OtiA23kwntlmOs5/L
 NA3mqfuZYSJRTcnB7l79yNcx1xjEK7rVcrjOZWpX1CVok1bqNXsOUkjTRoOaZFOBi/xJEsEe
 FoAs2ZzPFKcWmCZ3SchWVryMzEZAVBIj62Bmw5/uCF2Tlfm350i2ECwtYEo3sG/JUhD7FZ+u
 XtKM1T5f1zZ/5TSZg4KPYKQMOxBGCIawnLKniuLVPuE7xCE27RqqTw/K4+6IiRCdE1JaMJ6d
 r8uW5jxC8PkxqEM7zP4HQLyGGGfIyFZ0Wj9ikEjKIJ+YEVR9LQQF2+oR4V4omdSs4kc7Pmss
 aISe5r6sDYXBTT8P5yrmvDsrlpWAsjuZ4uy6MGcmPLhP73AavXkcGeWMrvBdPWYEcZsyXEcz
 A+YAQ=
X-IronPort-AV: E=Sophos;i="5.96,206,1665460800"; 
   d="scan'208";a="85866557"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Nov 2022 10:10:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iH6HN18S03N5HgH1+Xrwa4laecsxw3iaWyUrJ/lvEXPEzmY5Ji75NzxT5/dBswF3I4WEY5oTdeIhF0X0fuMTXOwqK1TbnS6cLYNwTxWf7gyq8Bpubn1FcDnDXAoqm7pml81kXMVghXxEXZXyRO+Qusn+n3iDIeXEbbyHD/kOpvFswRXzx36tlJVlNmJV7xRu5RNt1lXDd0D52ISBYosMPjIkSaVsVmKg3YIgRW4BiOsGvPNB678157Zk5GawF7iY5ezlSAdDDPlmf1zf3lLbdQzuNVztrcSxeO2KuGG0LIqU8sK/1NoQJZornOgHylHxWyg7dWU4BEw6ubmCsC2+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZu0f4REIMCta0o/FGi0CGBdzmQ6cRIU6CKr6+ow/1Y=;
 b=EyD6nnK3skT+cN6Q+NToM6zFo3rYbZqFon/sHq80w2R79EhLSdexUNpBdSTgfLYjqy1fZRhwF3yKkJwnAa71nzSg+dOOGVQ3Oe/8Ms+9A13NW1kHBY0M5gv7ZAR6DiuTTQHNm4B/hIHI+ewm1Ni4hby0iUCM+WIZpblMXLpKIEpAxErcWOg5agCinGRwujLs7LqTDFm8jnXL1SfQP7BeqfexuBGNzukmZ42cAJ8TRVsw8bXtKqtBepv6wYiX7qCRz4LT8bIV8EUPHJbu5C5EBC8y1AvOl5JJ4yATsrEvdhIATP7GRowsudqR0wPDS8t4IT8KDLjcg1zrZC0fCHlDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZu0f4REIMCta0o/FGi0CGBdzmQ6cRIU6CKr6+ow/1Y=;
 b=ugTRHSsa6sG4ugzi1rgO4E425SdSnniU6A/gWXpN9+Xxwnvg8dhibb8yz4+8TxCciXuCWMTc/gXpzSbNgtJyqsP9FtrztIhYX/iQMliHh8syHSpjh7qsOBzEHRJFHw/jAfgtzhQA45tQJUfSQ1sSc6AZnBjcG80f3egciADXf/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5149.namprd03.prod.outlook.com (2603:10b6:208:1a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 15:10:54 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 15:10:54 +0000
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared ring
Date: Wed, 30 Nov 2022 16:09:11 +0100
Message-Id: <20221130150919.13935-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0165.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::33) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9baf0c-59ea-4337-3e39-08dad2e51343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xo2ptJEmCY92/7dFY1PDP/VqgTLmRrQjLa5z1qS6qluoSkcstOK2PjaoDlXUcOUrnab6qi1GPw4sjgxVCdK5iUjV59IDEnL68v6Kb0LcdKwxsyTj0svMXeAzYdz7p8LwAf0rIFTb14O160KeTBUHHEQYlF/9G0my1Cegc7jIQMPMCaCbcHOpi63ItTqwM2pUwAr2Ni0nq+/1zBMt69pJoWeFR/b3vWr9962uNJbi9xP/JzOmvmmkI/JGC+amM9xF84pFbyeySM1d+yygbU7MWbwabXJNAI4mlS4LJyAVmZSDsmBMu1hqt8EpiR7VDQHxiSynpT21JvDm+T4N4ffHxPtbb9f/BzBNvK33ErEmp/IKRKtzB5m0WlyExjFg3QnhF1JqhD4b3ST1JxKtyrk9a4oaYvcdDrb0L24HFL9YDTSRIsImyJXnP4D+oUrsoUmdoo1dT6OJ1EmJGp9ne28U85ac/3Lp2Vm6OY3L/SUM7p4PpAFEHKw3/9teMKWpciOspqffOAWXxWKa8lBQNVGmWlJjBR8gSyQ8wYWXFbLmm4PSBQb1M1sUp2wV1rbqYliN1eH6E2ArhApjlc6RsCjpCEPJ2pWbnkZgmMjo1GmhP+phYY8YdwN4yhPkeUnLI7avSWF6DmcGLEUbgVqAgbr0HA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199015)(36756003)(7416002)(86362001)(6506007)(478600001)(6486002)(186003)(2906002)(316002)(66476007)(41300700001)(66556008)(6666004)(4326008)(66946007)(5660300002)(8676002)(8936002)(54906003)(6916009)(2616005)(38100700002)(26005)(1076003)(83380400001)(6512007)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VUxlOHp1OUUxdnowS3pqTEhib2RuL1hPaGZCUDlRbGxrV1BzcnZPcXVCSDNM?=
 =?utf-8?B?NmQvTXNmTi9PVUpUZGY2M2FVN3hReTFpYVlSK3V1c3R3cHBJdU80eWlsVUdD?=
 =?utf-8?B?ZWxUNkt6QXdZdFhOa0RtM2NTUW41RkFtRnd5cWQ5bXpEZ2lTWkFiQklsWU8z?=
 =?utf-8?B?VzhyTmRLWksvTk93Z0ZMb0QvZXlJcTdJSjdseGpwSk9kNStPZjU1WGFQWHhq?=
 =?utf-8?B?S05WeDBFOHF5NS94czNoYVZaZHd1NmVtVlAybDQxalc3cXJra1QweWRTd250?=
 =?utf-8?B?T1ZMQ1FmTHNJY1ZIUmNCWWdvdDd0aG1CTm1tcVo3WWcvcWh1am1mMEtnT2Rs?=
 =?utf-8?B?NnNNN2l5Z2lkVFBneXJiME9URHBEUFA2UWlpU3R5U2xZdzNZWTVhbmpTR05a?=
 =?utf-8?B?VmRMRldvWkkyU3lzV2pBZU54UmJ6b21adlA0bzV5dENwTUk2V0pJUVNPMnVj?=
 =?utf-8?B?OFM3TUVlYlRSREdCOHBydDYvdWp2aUpteHA0RE9qM0dlNS9JTWoyMUk0WWpK?=
 =?utf-8?B?SVpSL0F6eHBIcVFkblFEck5Hc21UbG81WE9rS2dSOHR4dk9pbHhqcEh5ZFVF?=
 =?utf-8?B?YVplRE51UDhncEcyK1lPUXFUOFJXYk1qM1d6dWVrK01jZnNFTFhBWEpWTW0z?=
 =?utf-8?B?QnFNOHZ2QUlyQ3Jkdkl1NUtSWGNjQ0N5TlJrbFhTVFJ0UDFZblYyaHJ4RHg4?=
 =?utf-8?B?NTdBeVRSL0RXVlZ2R0tCUHRTeHlZa3BZQkh4TWRpMXNET25LWDlEdi9saEc4?=
 =?utf-8?B?aUdkMW1KMWNvM0NhTkZtd0RiMm5yaUdLb0VQdVpaTUVyTTR2TG1nbC9CdWlq?=
 =?utf-8?B?ZUJyR2pSM2k1Ry9yMWlUcXJVUklXdDVhQ0MrdHV3WFg2ZUd4ankyb1Jkd0ht?=
 =?utf-8?B?Rk03R29yeENFYkJxWTR3OWxaVTdsQXFDZUlXbWFvc28rZUg3ZmsvSjZPUzE5?=
 =?utf-8?B?b052VVFPdmZjbW1RamxkdVpwMTdJN1pQOExxTWd3aExkcytMYlRLTTNxTnpR?=
 =?utf-8?B?eHhucmVkNlJPVlZNWDZhVnJxdUtHMjY4bDZvMEFMQTE1blBLL0tyOFQ2SjQ5?=
 =?utf-8?B?N2loYW1sVzhEU0JKS1NxdldKYU53aWMvR0tQWS94NlNGRUU2VFZKZ0pBOUUw?=
 =?utf-8?B?b0xZb21meVpTMWkyS3JiY1grMDA1UldpZ3piVEVWWVREblFIRVVaUFBPaW43?=
 =?utf-8?B?TzNRaThZRW1Ib3JDcXlKQURQay92czZwVlA2ekQva2V6cjNvQXJkQzVwOGly?=
 =?utf-8?B?V3cwMkRNM0V0UjhGZUFSWnBURUR1dG9BT2kvdzRBYzZZek1zOUdJanNLZm5m?=
 =?utf-8?B?ZCt4WC8zNWtacGl1YWY5YkhqNm9jenBQOXdIdUczanErZDF4eUVZNFVwd0c3?=
 =?utf-8?B?SHBaY1BiU0YvVUltNlQwRCtrQXZCUEFzRDQyVUhmNDZlb2JtakIvRUtIRjNX?=
 =?utf-8?B?Ri82SGFrMUlrSVRSQUczRmlPSVJkOWw5QUtyN28yLzNjZzJHeTRhZnNkM29J?=
 =?utf-8?B?QnIrWEFOWERRS2dYOHdCWXdxUmxEWGNHTURKUE0wM3ZDY3V2dVhpNkdQSk1w?=
 =?utf-8?B?TmNQcnMwOGVoeEZHcmhvWWdyUkVyQy9DaG1udTZjejBFZUdBcWRCM2FQMTli?=
 =?utf-8?B?d3JCTXVuTDljWXZBWUNtZmc1Wld2ZnVoL0VKSml0eUpmdk1jeURRTFBLTkdK?=
 =?utf-8?B?b1FvUHJjZHZUazdXd0I0NVV3MXFzcG95RTBaTDZURmVzVE9xR3gzUnFJNkFs?=
 =?utf-8?B?b1c4RmpQbmJTTTVlaURLYytQYnNBSndyMkJnZW55azV1Mlc1Tk1OT0dJdnIy?=
 =?utf-8?B?eGw1d3g0cWZ6WWRoYlp5dEl5T0daMDZ0NGhqNjBXVE5JMHJUd2UxbXkrcnZi?=
 =?utf-8?B?NnhLTTFneFBNanpybXlHdkNVZ2JOUVhlOS8rd2Y4QkZjanRxb1RPYjZCQTJJ?=
 =?utf-8?B?MmNkaHYySEVtQkVtT0RTVHNjNkNhbGxhUW8vQnFmVHFMai9WTDVBQVVWSkRp?=
 =?utf-8?B?c2RzU2tXMDZVM3E4VnBzdWdPTjFDR0Niay9VaXFIYVZlZzNveEtaUUIvc0NW?=
 =?utf-8?B?dXlJdXNOVlBnME8wNzdXSXFWWXVXN1d5aTllN0xEb29lb3dxVVR4cndhRzNH?=
 =?utf-8?Q?fAWR8cQ9vVuXwqFgGgPiIseIa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?VER2Y3F0SkdwMi9LMkxaWTgxVXMzazFoVld1czdjZkZhbmpiQWVtRWZEcVZx?=
 =?utf-8?B?VjJNeXkrVUFpL0h6ZmxhanZDODJ5MmpZVTRkMEhUdzZrNlBhSmg4MnZvZEd5?=
 =?utf-8?B?d1dpU2pDcTZFWThLcWZYSFFKYmVTT0Q0V1hQUVF2YWhybjV1MUU3Q1k1RDgv?=
 =?utf-8?B?cGhpTzFhejhiVkRSaCtUMDNQenpuNXNxNUxVN1VKWGU0dXdHQWROQjVmSWpH?=
 =?utf-8?B?WXh1UEZlRko2eWM0RnlubnZKWFR5aUNHblFHTUFBTnZZeCtKbkEyekNZVGhK?=
 =?utf-8?B?dS8wRFJ0RExvWmtlbVBYeEFGYTRYS2dDdDJwNjVrVkRWOTAwTzQwek1yMVJB?=
 =?utf-8?B?cisyb1RnemZBdkhaZDJmaHlFTGpDTCtXSFpFUUxRWDNnMUlGOWYwMEtxS0VX?=
 =?utf-8?B?aG9FN3Bnb2ZXWVp2amFmaTJjbEgvWkp5czd4MnZkMlBJaDVYeVhYYkpYUmNX?=
 =?utf-8?B?YS9pN3B5aGFNMjJrS1k4ODB4eC9LU2RTb2hjbzNZdm1xUS9LSVZhMVdEaFE3?=
 =?utf-8?B?VFlZNGk1VzQ1akFNakFEVWpDODBDWkdkOGVKcWlpbjNUSzhDYTFaSXlvN04w?=
 =?utf-8?B?K2k5eDFDVjc1ajRlVy9FNmFVTDJtbWhyS25oNHMzZEMvU3ZkSVg5WmNYR1Rt?=
 =?utf-8?B?bEQ1Qzc2cjY5VWY1MHZxd0dkUGQ1UlZ6RUxPT2dzaHV2SVJXdytXRnpXb2Nr?=
 =?utf-8?B?SFNoWFYzN0FKWFRzR2ljNThYU2RJYVl5OEIwbUVGck1XYkg4OE5Rby9VWTdv?=
 =?utf-8?B?N2ZrR3RJSHNFRlRSUkhkbUFuZHNUNnR5SVN2SGxKM1pkZ2lYYWpZRXBIcGNU?=
 =?utf-8?B?cGJtcnRNR1lIT1NxdnhpeHR3eEl5WFlHc00zdXRGY2VyUGlUbE8zZE9TTkJz?=
 =?utf-8?B?NXNpWTMxa08yd3lxYm1oQmZ4YXpvU0I2VHVzNTlVV0lqaEVNSEU4Vjg3dGhP?=
 =?utf-8?B?VjB1MlFzajFSaVorRitwdWVQangzWGpvdUtEZURRaVY1N3pKUGNyZHEvMUJi?=
 =?utf-8?B?a1FNVUc5SlFubTNWc1hPVDZLS2tHdmdoanEyU1ZERk5rYXdMc295b1hKeVhJ?=
 =?utf-8?B?bHVNMS9VMkpQMCtodGJzM090S1pvcCtOREFDclB5emJzNEhIREpod0Mrck1j?=
 =?utf-8?B?c1ZmV1lDRkFNa1FROHc5R3dZcWErYkM2VkRCM0lnc3Zhb2h5em5va2kweS9i?=
 =?utf-8?B?a3pBcU9UMnQxRU1VN2RCdngvcWM4M2pFZVpvZzhTYmZManZLb3pMZUtZN3Fy?=
 =?utf-8?B?YkVPTUlta0ZEMy9vVkJ5SUxpWTJHalZYSEFsSU93Mk9zTy9TeHJhWmZHV0F1?=
 =?utf-8?B?eWJSbzVUV3dOb3pzeUt2cTV2QnExV0FpaTlaMUpUUGJtbTVPY2hiK1lOdmxN?=
 =?utf-8?B?cTVXZVVXTkxvMEVoMzMyR3NFNTgvcXVSODVIUElPcnNQNW5zZjZla21NOUQ1?=
 =?utf-8?B?S0pKblhWUm4vV0xZNWo4eVpSMy9RczZZZk1yNjdNb3NWa3BGd0JGckl1NFVF?=
 =?utf-8?Q?FpEufFxKZvcLWBjWVJ+VhHRBfSi?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9baf0c-59ea-4337-3e39-08dad2e51343
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 15:10:54.2457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiSLTWgBuEIhT9ho2XTv3uD1zByPNmYi7F6/DFCgKhYnHhFRg6Mot9jZzwLlKe7eFRKujLMY5Kou2msvnGpXFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5149
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Jeremy Fitzhardinge <jeremy@xensource.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Chris Wright <chrisw@sous-sol.org>, Jan Beulich <jbeulich@suse.com>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@elte.hu>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hvc machinery registers both a console and a tty device based on
the hv ops provided by the specific implementation.  Those two
interfaces however have different locks, and there's no single locks
that's shared between the tty and the console implementations, hence
the driver needs to protect itself against concurrent accesses.
Otherwise concurrent calls using the split interfaces are likely to
corrupt the ring indexes, leaving the console unusable.

Introduce a lock to xencons_info to serialize accesses to the shared
ring.  This is only required when using the shared memory console,
concurrent accesses to the hypercall based console implementation are
not an issue.

Note the conditional logic in domU_read_console() is slightly modified
so the notify_daemon() call can be done outside of the locked region:
it's an hypercall and there's no need for it to be done with the lock
held.

Fixes: b536b4b96230 ('xen: use the hvc console infrastructure for Xen console')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Properly initialize the introduced lock in all paths.
---
 drivers/tty/hvc/hvc_xen.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 7c23112dc923..e63c1761a361 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -43,6 +43,7 @@ struct xencons_info {
 	int irq;
 	int vtermno;
 	grant_ref_t gntref;
+	spinlock_t ring_lock;
 };
 
 static LIST_HEAD(xenconsoles);
@@ -84,12 +85,15 @@ static int __write_console(struct xencons_info *xencons,
 	XENCONS_RING_IDX cons, prod;
 	struct xencons_interface *intf = xencons->intf;
 	int sent = 0;
+	unsigned long flags;
 
+	spin_lock_irqsave(&xencons->ring_lock, flags);
 	cons = intf->out_cons;
 	prod = intf->out_prod;
 	mb();			/* update queue values before going on */
 
 	if ((prod - cons) > sizeof(intf->out)) {
+		spin_unlock_irqrestore(&xencons->ring_lock, flags);
 		pr_err_once("xencons: Illegal ring page indices");
 		return -EINVAL;
 	}
@@ -99,6 +103,7 @@ static int __write_console(struct xencons_info *xencons,
 
 	wmb();			/* write ring before updating pointer */
 	intf->out_prod = prod;
+	spin_unlock_irqrestore(&xencons->ring_lock, flags);
 
 	if (sent)
 		notify_daemon(xencons);
@@ -141,16 +146,19 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 	int recv = 0;
 	struct xencons_info *xencons = vtermno_to_xencons(vtermno);
 	unsigned int eoiflag = 0;
+	unsigned long flags;
 
 	if (xencons == NULL)
 		return -EINVAL;
 	intf = xencons->intf;
 
+	spin_lock_irqsave(&xencons->ring_lock, flags);
 	cons = intf->in_cons;
 	prod = intf->in_prod;
 	mb();			/* get pointers before reading ring */
 
 	if ((prod - cons) > sizeof(intf->in)) {
+		spin_unlock_irqrestore(&xencons->ring_lock, flags);
 		pr_err_once("xencons: Illegal ring page indices");
 		return -EINVAL;
 	}
@@ -174,10 +182,13 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 		xencons->out_cons = intf->out_cons;
 		xencons->out_cons_same = 0;
 	}
+	if (!recv && xencons->out_cons_same++ > 1) {
+		eoiflag = XEN_EOI_FLAG_SPURIOUS;
+	}
+	spin_unlock_irqrestore(&xencons->ring_lock, flags);
+
 	if (recv) {
 		notify_daemon(xencons);
-	} else if (xencons->out_cons_same++ > 1) {
-		eoiflag = XEN_EOI_FLAG_SPURIOUS;
 	}
 
 	xen_irq_lateeoi(xencons->irq, eoiflag);
@@ -234,6 +245,7 @@ static int xen_hvm_console_init(void)
 		info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL);
 		if (!info)
 			return -ENOMEM;
+		spin_lock_init(&info->ring_lock);
 	} else if (info->intf != NULL) {
 		/* already configured */
 		return 0;
@@ -270,6 +282,7 @@ static int xen_hvm_console_init(void)
 
 static int xencons_info_pv_init(struct xencons_info *info, int vtermno)
 {
+	spin_lock_init(&info->ring_lock);
 	info->evtchn = xen_start_info->console.domU.evtchn;
 	/* GFN == MFN for PV guest */
 	info->intf = gfn_to_virt(xen_start_info->console.domU.mfn);
@@ -318,6 +331,7 @@ static int xen_initial_domain_console_init(void)
 		info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL);
 		if (!info)
 			return -ENOMEM;
+		spin_lock_init(&info->ring_lock);
 	}
 
 	info->irq = bind_virq_to_irq(VIRQ_CONSOLE, 0, false);
@@ -472,6 +486,7 @@ static int xencons_probe(struct xenbus_device *dev,
 	info = kzalloc(sizeof(struct xencons_info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
+	spin_lock_init(&info->ring_lock);
 	dev_set_drvdata(&dev->dev, info);
 	info->xbdev = dev;
 	info->vtermno = xenbus_devid_to_vtermno(devid);
-- 
2.37.3

