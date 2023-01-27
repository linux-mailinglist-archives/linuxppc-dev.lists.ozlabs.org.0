Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AAD67E67F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 14:21:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3JBj3V2jz3fJ0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:21:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=RE7CrgK0;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=taFtl048;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=RE7CrgK0;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=taFtl048;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3J9m2q0nz3fDD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:20:59 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30R9SpIl008652;
	Fri, 27 Jan 2023 13:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=cQ0mV8qUadqXzARTIS8nCOjIM8q3ZGztG74T+ylQfcA=;
 b=RE7CrgK0M/Mh0OAwZi15sCbfyRoibEwTykiRoFNHGn7Css2o8XEAbxCX0A2O9/4qfJA6
 buhrtixrBVG0DvxKWLFLQ2U8IfJ5TP4WRyxwxV1AyQ4r42qBkK7XaPzTQ/2HnhMvufK6
 9ezzEqOnrzy9wWaVLTNkk1NVnWvW23S1sljvHIoum0RiDPS0AFKy8qD5CdBB/evgzNaQ
 R//VPJiU/7v0H96BM41lu7ep2PFAmBc1fapY2wa+75PkpSEaCyI35KKEOjMdR1VCg7za
 wn0JjWIk5yy/OswOC+UokOWZtxL0ojJSSkaX2bE8BOhW5+jHFFS4HKhkcUOosHoF8D3u 6A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n87ntcpwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:20:32 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30RB4heR034629;
	Fri, 27 Jan 2023 13:20:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g9jmey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFAVGIxGiFGH+KvlxWVFlZclJlqJl4gwh6R4thNa8A/wEiLIiP6J0NTaLygrvVO6h1rM4pebFwvPqUpjURi7VzBEp+j3bHQd+YzfHKDsU15FmGvyw0VhQeMnbgWIJ2CebJWN23zSaFU8OStmNYafZebdadamjc9x74ZDBdf4Hvjq4402OrV3i6tbXnqmJ3AVxYWHRscbUYlPk8+c7BOrKoMZ97CFfjNqVuV8Hyohu6XSdyNH26gtn5MJ0/6JAaPr8a8QcAXU6L4xsfHNuh21MtlBy+05SEx/P9WnX5XOAQIHHPQ/zhxWYzRQQWpgtPxZaeb6f5xFO2ttKvYeRDsQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ0mV8qUadqXzARTIS8nCOjIM8q3ZGztG74T+ylQfcA=;
 b=gJlhwb/6Wrf+1ZjQ6U9k3orhraqMpyZS060OhMIO4gMZDNrWD7AwhlO51Lbt50VPhin2FUeJYlM3eoL/PDTqzQZ+Dt/aqgyDAZd63aTI1VyEaK3xZJiiYu7e5YLxCrN0BoiTsqaii7etTpJZOma0c/DtsJVgAvtfs1iggIJ+vs6qy14fYaT8LE1bp3KoML0oejYUX4baVUyqTFAErrIcPlqz+MkNmNO4VjcXiBki6IuO5IfHMQ9MMmPcYvVIwDUXCdpoPIrkjdm8u3HC23jGuhBFHeUuH/Rf9toMU/9kXhYafKBqrwGvuBWdM3peHSe9AgXB/MW6bkaS+P8gHcqaZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ0mV8qUadqXzARTIS8nCOjIM8q3ZGztG74T+ylQfcA=;
 b=taFtl048PkQ0FnS9xzHGoAf0H8uZ7whXVJJjP0p4f/eEFVIxHlL2BHImpASUjwjn5CtES97qnHK3nhqMoD/cRCsFvabD77bvZ9xUie4ObabbCpOfuGfx23AHCmXfnOLqOb9cLnHihBkSQC71LYOBpE5GdLexvODmTak46Oyq1dg=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH7PR10MB5724.namprd10.prod.outlook.com (2603:10b6:510:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 13:20:28 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb%6]) with mapi id 15.20.6064.010; Fri, 27 Jan 2023
 13:20:28 +0000
Message-ID: <56f1ed31-886d-358d-cfcc-0ab9fe7a76d8@oracle.com>
Date: Fri, 27 Jan 2023 13:20:10 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 00/15] jevents/pmu-events improvements
Content-Language: en-US
To: Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Kim Phillips <kim.phillips@amd.com>,
        Florian Fischer <florian.fischer@muhq.space>,
        Ravi Bangoria <ravi.bangoria@amd.com>,
        Xing Zhengjun <zhengjun.xing@linux.intel.com>,
        Rob Herring
 <robh@kernel.org>, Kang Minchul <tegongkang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sandipan Das <sandipan.das@amd.com>,
        Jing Zhang <renyu.zj@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
        Kajol Jain <kjain@linux.ibm.com>
References: <20230126233645.200509-1-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096::18) To
 DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH7PR10MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf7faa0-7070-4592-1a73-08db00694208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	exNowhqkbuTKL/fd/jATckBdPhq9EI6bHisyhcO36Q3QK7xotcSwaqhv9wuqgW3Q86lYUNDBIC3q+4syBrdpiJ23qw7N/WtfAI+Y5+1ThG7CSbY1Ixj2Z6Lh6JxQMQEkvQ9dPKywXsb/MvZl91l/jJoa4POVg+L4DGaIF9XdrsQhV7aE1nPUzzgkDfKo2NyGmOJHMpP00D5IAnIwMZLKFa69aaja8KVxr/5Ev6+uLZOymVYqQQATouHeaigG4PfFKEbCl5cIy1BdvrOe7dd0C9/TsTqoBIcbYyMNNHDXxSugA6IrG0jKUQzLAm9k9PGEEmN/LqX1D26W7YRJQMkF7KpfIn0IosBp84jNpXkbweikDVYVF8OlxZDML09zwKBsHJafgXVjMuhsnuLrTI4hQxUskohvY+Ga/EHi1FEz1nY6ffVFJXPGiYOUrdiBYfrcslQ+YLYfGCCj2RJAoekPCObuHdJJUz+8wIAMd7raCeiom5fpP521wbmthMOZFu5VcrExQ2PlNsjXj+Iuq4lZP9dI6JYo6x3eL00jgMUBNAc94ZsnnQJLzGsEWNjsOLN9SpxFMpRUMhZZfrLtthtH+uq5c9vHeJ76ZceWpGFLaxT3ssMQ/it1VspiknOILdg2HICuaad25WtEQTtYgPz6DIfb+2ZEy0zl2puiB2FgwfEqfO5OeSt/hP2HfMF6k2rcQzxe8RwFOIFAiVABsTMX6iRydTdCqD7Lodc12pFszXEBdjurHcaXg9d7epw1d0fy
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(2906002)(8936002)(7416002)(5660300002)(7406005)(41300700001)(4326008)(8676002)(316002)(6666004)(54906003)(110136005)(6506007)(36916002)(6486002)(478600001)(31686004)(31696002)(83380400001)(53546011)(6512007)(2616005)(186003)(26005)(66946007)(66476007)(66556008)(86362001)(38100700002)(36756003)(921005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?enlvT0toZG9ZbVZYV0IxLzVpVEFSMmZmOG0zaG1pVGtyVXZEajQ0R2VWSlFa?=
 =?utf-8?B?SUg3QXZKdGh0N2Y1SXAwTWRSUEkzQnZXekxWR0x2ajdzdytHVFhRMW1tN0lM?=
 =?utf-8?B?aUxkQjY0KzhOY0xQcHFtYWh1Mzg4N3hhcmpwb3dMRVVtTlc1djh6bWEvMkFt?=
 =?utf-8?B?MjNjZFYzS3ptbzl3MmZqbnVCQXBhdENlYUF6Y2hYR0l6OVVxWVNyYkduOVpa?=
 =?utf-8?B?QVI2czRtdFRodDU4LzR4QnVIdUJ4UU5pODd1Y05vQzJkUDRGQUlCQTBMVmI2?=
 =?utf-8?B?emlVRDNtMTlFbWpaL2wyMmVXanNGa2l5S1ZKWU42NGtwTkZsUm5oSEd3RHVP?=
 =?utf-8?B?S3BLamRHWFRyN2c1cTBDM3A3NzAyNERKYzgrY2dlY09lN3JWQVFXWVJHN09o?=
 =?utf-8?B?eWlGVlE4dG54c21aZWI2ZC8ySUVNTWN5d0xwd0p3bkdpRDAweWtwY2M4YzRH?=
 =?utf-8?B?ZVNEazZUL2RGQVgyV2RnRjFicU4zemhtMUxCaVZ6eVIzSUc2NHFMRk00MFB1?=
 =?utf-8?B?YXNTVzZ0cGY2NWk4Tk5oU0w3dU5wTGtJdGZhbG5LQXZPTGRIajBPYnROT2lm?=
 =?utf-8?B?TmVxVVVIaGdlZlhrR2NVdU1JelVCSW9Mb3YzU1d1S3UvazRFMzhzYW9MY091?=
 =?utf-8?B?K2ozbkN3SlE2NWhyb1lTaVMrdVFzVGIzSml5Tko2MkFRbmVIRGRidlZaYjFY?=
 =?utf-8?B?bndxTmtIQkhmalZIbE41VkhmWlY2bmxxRzNQOStkUVlUbVlDeHRkTDM5QzNp?=
 =?utf-8?B?dkw0bG5NaDdnMmRCUDM2ZzdtYmhaL25zM0hIY0tNcmUvTXJHS2VhekIrV2JC?=
 =?utf-8?B?MisvNCtsTkNzcUQ5S29wd01CVFdZTEZTcjBJNlV5MHhjWEZHQWFkbFh4TUZ1?=
 =?utf-8?B?OExxUXVmZnBjV1h4SS9SVFNhZzRQWmJ4L3F0MGo3WTU1NUU3cG9NTEQ4UE5C?=
 =?utf-8?B?ZWl1UlBXWFpPaXZ1eFJYRXlhRXJKbHl2RTJsZU56NDJ4d09VK0FJN0xRdkdO?=
 =?utf-8?B?cGNpOUlQbms4UXhNc3JwNGV3VmpMYUVCSWRTcVc4N2toYlVJWVlMK0E3eGZq?=
 =?utf-8?B?OHBMcmlyTThhbWlqemdZY0VOQlFReVNnN0JhT21qNnZiNTk5OHl0VHBtWE5Y?=
 =?utf-8?B?UzNBekhGb2xCRXpHSGthWXRiU0tNajh0TUtpdENVMkw3aGo5anhrcldyMSt5?=
 =?utf-8?B?MEs0K1pPUkUzbFBtZExCSytHT21keFhOOUt4czJHQ05YL2hzeGNRaGIvbGtw?=
 =?utf-8?B?Y0xMZ3RYeWVPOHNlWmJJQlJFSzBNQWdEVzh2OGNKUnZabU9zNk5zaHFhZDJG?=
 =?utf-8?B?RmlhMk04WTM0TTU1VndvNGNBcVVaN3QvTWtwUFFsRFVWbHFyK0VVYjRkTWEw?=
 =?utf-8?B?SnNoOVFYRENaYTl6TERiN2x1Wk4vOUhIQ1gwNlMrb205NG9RYUErVi9JNE5W?=
 =?utf-8?B?UlQrU1E0dWVkbTZRVWRiZjRzTUNyWEpEZFo0eTNDWUN4N1NaSTVtazBWM2dp?=
 =?utf-8?B?Y2lMcjRjSHdOUjdFcXNadjAyVFF2K2E0QjJSQXpLMFZ1U2I2V21GWVZnN2gr?=
 =?utf-8?B?aUN5VEV6cTB6OFh4TmlIaTVlMkh5OWJobVJxWks2UkNIUnM2WlJYKzMzeWxy?=
 =?utf-8?B?SU9xUHljV0lLMlZzc3E1OXZkbFVGSmZ6T3ZLa3NiZjRFODFlYUV0dmRVdzk3?=
 =?utf-8?B?aHJRS0ZLUElHMExpdjNBa2JDNXJaNWdRa0ZLVkFIaHRsYkhsSzA1bmRReFBO?=
 =?utf-8?B?d0dNVTQ4ZDg3UFJ4d0g3Uml4RWRmM1lUUmZXTWFMck40ODduc3RDZnlCU1k4?=
 =?utf-8?B?dFpkL1RDdnNKZnkyQ2JKMzl0QW5WVFhnODg3NmtKSXd6T3lLdXVjZTBLL0d0?=
 =?utf-8?B?WUVjU3hBTndDRVNQRnhCZ3Q5Y0VGTEo5K0dSOFJQMi9UUWdtOG50U0dSOHN3?=
 =?utf-8?B?MTNJRWVBbXVYblhDc0EyZlJnaWtoNEJraElVVUlkUXIwRFV3bkNlT3dKeDEx?=
 =?utf-8?B?ZllpVlhTelBiVXRsRVdUdHpLVC9oUzZ3VUVqUmZ6QXFFcXRORG0zTncwMXNW?=
 =?utf-8?B?YnRjS1JkbzZ1c0w3Y0dkMzV0WWxMU3Y3RlhhNGxmU0t6V2QweFdoUkovK0xk?=
 =?utf-8?B?YlJMZ1JpSEdxUzFEVUxzWGhucFVRT2lPTVNoL2M3bjBsV0VOK0xZUGNiMWRR?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?YmhKYWljcXBCY25YaEI2WkozMEY0ekp5ejFCMThuTVh2T2FOK1FSWjJnTTFW?=
 =?utf-8?B?N3VqQW5KbmdPcjkzYWtMMnZaZDZ6OHNXK044OVVXQTdvVzkvRnVmcVcvWXEx?=
 =?utf-8?B?cTVkejN6QnQ2aDNiY0Y3cjZwell0SFZFVXVDdldhNFdMblc3NndlMENOcDB0?=
 =?utf-8?B?SXJURXF4cUpXYXI2a0p4UjlGOEwzNGMvYk9xSGxwOWE1SDN6UGppNzJpejlK?=
 =?utf-8?B?NjJBNWo5UUs2Wm04ck5pSTBpbm9XcWFmbno1L1FBdlZML3R3MHFvc1JjSTFC?=
 =?utf-8?B?dDYrOVFrNjVhNEFpRzRPTndBYnRyNFY4UXFMRWUxejdJY0xaZzJ1RnNPcjJk?=
 =?utf-8?B?N3BMM2JOOVlmRjArdERucGdDb1A1dUZRcFo5ZUN6Q0E3SDRERXc4MVRIeFl5?=
 =?utf-8?B?WWVxZFRTNnhxS0VSait0R1JBSDJOS1JoRExaamFVb0JHV0VjUzFubkx2MDZq?=
 =?utf-8?B?azRvd1cwQnkzdmNDWmtsTzlZWjlFUEt4YWFBT09QbHlNZEhGdURVYWZ2N2lh?=
 =?utf-8?B?VlcxeHRkRkRZemlkVThYbytGNUtjR1RLdTNaMVhaVTBIL1dkTHNOdVFMMTRh?=
 =?utf-8?B?RFlJVDQySVdqNjIwQ1hGa2V2ZDQ1K3NIR0FTRlE2aTJDSVd1QkFEdHlvWUJk?=
 =?utf-8?B?b2pDZ0c4TFcweWcyRE1sVTg0eWl0V0d2ZjU5MDBuOUtkMVNJQ0ErYkVLS2g2?=
 =?utf-8?B?cVZpSk1WV0JwdmhKN1Q5UHB3YXYwWVlweStIckhVaFowYU5YaWx2MWdOaS9a?=
 =?utf-8?B?UVNLc2hwcTVSNzM3RGdVYUdUVW5RNHZOS3daSmQ5MFhma09FMDQyOWJKZy9H?=
 =?utf-8?B?aDFheUl6SE5oRU03bGs3bTlYdmQ4emRrYjBFRXlZb3lVbC9nYUdVbnRNNTAy?=
 =?utf-8?B?MHdLcDl2bzVWMElWKzJJL3hIc2VvUWhJYXpHWjROTis3Z3R1U1AwZzJPeFdK?=
 =?utf-8?B?dlpEK2szajkzSG5DSTB4akVLdUZYZkxTV3kxY1RmRnZRZFFpdG9PUFFHSjlO?=
 =?utf-8?B?UGpVS3k2Tm8vM1d3ZUovdHcxZG1ZeHpyM3VXNWtkSDFnUzVxLzB6TjhNSlVy?=
 =?utf-8?B?eW1EbGV6ekxTSjkvc0ZPNFZDbkRROVFaQjZDaGhrSVk3WVNiUUFzWHY0ZTBP?=
 =?utf-8?B?K1RDUm45TWlTN0FWNCsxcUhjRDh3WVZuTDI0WkZBVlNsK1lqUXBYY1hWRmta?=
 =?utf-8?B?bWVsWVBjV3VkWFJzWCt0MmN6Z0ZOSVp5cktQcGxna01oSE9PZ2M4ZmdrUDI3?=
 =?utf-8?B?eE50TitrWno5bkpEYllyMVN2SkhvTCtzYjNzbGg4bjhBK0lZbWJJM2F0Nnpx?=
 =?utf-8?B?bjk5bnlacUthR0RiY1puYy9QZDE5Q2lhQ0tYVUljN0hkMGhwRUpENGhHRDI3?=
 =?utf-8?B?MWg1SkdVY0x2b2o0MUtYVXUybS95YzNHaVdXajlhRG13NXZudzJuRVRwY1li?=
 =?utf-8?B?bmp6T2FXOUFJUFdwejV1ZHdFYjd2emFyZHF0YXJFaFNDdlZMZkpmRFlSOC9v?=
 =?utf-8?B?ZEg5cm80NW16V1VrOEVadzhSRmV4dkk3NzB1MS9wMVVSQ1ZJcXhNdW41UG9T?=
 =?utf-8?B?ZXJFT3hFZDNZQk93RkVJdmZrMXAxaGpSUUp3V1VWUDNsOEpJSVRTU1d3TDRv?=
 =?utf-8?B?SlBCZEtaSHZzeEhIVEJ1dWdYbWowbjlxMlJ1dlhwbUhOQ1NoWkVhVEZ0V1VH?=
 =?utf-8?Q?whhxilf+8YiZMNTfxim0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf7faa0-7070-4592-1a73-08db00694208
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 13:20:28.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4esWFbjvfRXNKkEuhF1oz3HuZN6uRybA832IIlod/bEdog0qr7pMu1YTUHVcgs8iiA3IrEaVnBWTYkRuccZSeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5724
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301270126
X-Proofpoint-ORIG-GUID: UKinbk8FESuJXk_KgBBZz085H91ZJ6nE
X-Proofpoint-GUID: UKinbk8FESuJXk_KgBBZz085H91ZJ6nE
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
Cc: Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/01/2023 23:36, Ian Rogers wrote:

Hi Ian,

At a glance, none of this series has your Signed-off-by tag..

Thanks,
John

> Add an optimization to jevents using the metric code, rewrite metrics
> in terms of each other in order to minimize size and improve
> readability. For example, on Power8
> other_stall_cpi is rewritten from:
> "PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_VSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_LSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NTCG_FLUSH / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL"
> to:
> "stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi - lsu_stall_cpi - ntcg_flush_cpi - no_ntf_stall_cpi"
> Which more closely matches the definition on Power9.
> 
> A limitation of the substitutions are that they depend on strict
> equality and the shape of the tree. This means that for "a + b + c"
> then a substitution of "a + b" will succeed while "b + c" will fail
> (the LHS for "+ c" is "a + b" not just "b").
> 
> Separate out the events and metrics in the pmu-events tables saving
> 14.8% in the table size while making it that metrics no longer need to
> iterate over all events and vice versa. These changes remove evsel's
> direct metric support as the pmu_event no longer has a metric to
> populate it. This is a minor issue as the code wasn't working
> properly, metrics for this are rare and can still be properly ran
> using '-M'.
> 
> Add an ability to just build certain models into the jevents generated
> pmu-metrics.c code. This functionality is appropriate for operating
> systems like ChromeOS, that aim to minimize binary size and know all
> the target CPU models.

