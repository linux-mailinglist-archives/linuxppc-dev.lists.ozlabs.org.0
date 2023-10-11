Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3107C4967
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:48:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YCA+7Fk4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51zN5BkLz3vvN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:48:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YCA+7Fk4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51yV3lwvz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:48:02 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5lT9j012610;
	Wed, 11 Oct 2023 05:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hVZ2dN1Oo2qcSiar0mVaZbwZh2f11VqpOPpFQ3+2WsY=;
 b=YCA+7Fk43t9PaniG0Fpyfp+j4iBWEvhSH7B5u5BpAUoIhTJCPovelM65B3v3HJ6LiW9A
 B6OMy0fYFV3oxH+sPnZV22Ovew1qWzSNKAqMuXkPvQvMSKYYI6YDUYfu+7sWN0mby1v8
 0Gzog+TxrjDWMrBX/kZw4ml4aPYLHeAWWDSAJ4zLgPbQkTokh4PxYmPHDXx0M1WNrv/R
 cGlJu6ytfpurbtNBYsgKOamvwjfyg2gQ3Rhq+js/B9J0d9sWywPlvGrmxmRvn1pibXre
 mT1XIPvmNOA1j+LmvjKNTMsY9Ro/ZDX3I8ekEYEYUTC4bBtRAMzyYxlaooCroU+ZGK6V TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnsb02vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 05:47:50 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39B5lYrF012795;
	Wed, 11 Oct 2023 05:47:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnsb02qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 05:47:34 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B4LRpm028633;
	Wed, 11 Oct 2023 05:43:49 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1y64e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 05:43:49 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5hlaq14811718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Oct 2023 05:43:47 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7867A5805D;
	Wed, 11 Oct 2023 05:43:47 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CEEA58052;
	Wed, 11 Oct 2023 05:43:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.66.34])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Oct 2023 05:43:46 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/vas: Migration suspend waits for no
 in-progress open windows
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20230927031558.759396-1-haren@linux.ibm.com>
 <8734yjwoax.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <ebeaa0f9-5d0e-317f-b0bc-f5212f6c8934@linux.ibm.com>
Date: Tue, 10 Oct 2023 22:43:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8734yjwoax.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JBUnylkqkByiju8PFCiZoBWPwslbOhxe
X-Proofpoint-GUID: DrAdV8m551EJIaoyidhabMNyN_EN5fkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_03,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310110051
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/9/23 1:09 PM, Nathan Lynch wrote:
> Hi Haren,
> 
> Haren Myneni <haren@linux.ibm.com> writes:
>> The hypervisor returns migration failure if all VAS windows are not
>> closed. During pre-migration stage, vas_migration_handler() sets
>> migration_in_progress flag and closes all windows from the list.
>> The allocate VAS window routine checks the migration flag, setup
>> the window and then add it to the list. So there is possibility of
>> the migration handler missing the window that is still in the
>> process of setup.
>>
>> t1: Allocate and open VAS	t2: Migration event
>>      window
>>
>> lock vas_pseries_mutex
>> If migration_in_progress set
>>    unlock vas_pseries_mutex
>>    return
>> open window HCALL
>> unlock vas_pseries_mutex
>> Modify window HCALL		lock vas_pseries_mutex
>> setup window			migration_in_progress=true
>> 				Closes all windows from
>> 				the list
>> 				unlock vas_pseries_mutex
>> lock vas_pseries_mutex		return
>> if nr_closed_windows == 0
>>    // No DLPAR CPU or migration
>>    add to the list
>>    unlock vas_pseries_mutex
>>    return
>> unlock vas_pseries_mutex
>> Close VAS window
>> // due to DLPAR CPU or migration
>> return -EBUSY
> 
> Could the the path t1 takes simply hold the mutex for the duration of
> its execution instead of dropping and reacquiring it in the middle?
> 
> Here's the relevant code from vas_allocate_window():
> 
> 	mutex_lock(&vas_pseries_mutex);
> 	if (migration_in_progress)
> 		rc = -EBUSY;
> 	else
> 		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
> 				   cop_feat_caps->win_type);
> 	mutex_unlock(&vas_pseries_mutex);
> 	if (rc)
> 		goto out;
> 
> 	rc = h_modify_vas_window(txwin);
> 	if (!rc)
> 		rc = get_vas_user_win_ref(&txwin->vas_win.task_ref);
> 	if (rc)
> 		goto out_free;
> 
> 	txwin->win_type = cop_feat_caps->win_type;
> 	mutex_lock(&vas_pseries_mutex);
> 	if (!caps->nr_close_wins) {
> 		list_add(&txwin->win_list, &caps->list);
> 		caps->nr_open_windows++;
> 		mutex_unlock(&vas_pseries_mutex);
> 		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
> 		return &txwin->vas_win;
> 	}
> 	mutex_unlock(&vas_pseries_mutex);
> 
> Is there something about h_modify_vas_window() or get_vas_user_win_ref()
> that requires temporarily dropping the lock?
> 

Thanks Nathan for your comments.

vas_pseries_mutex protects window ID and IRQ allocation between alloc 
and free window HCALLs, and window list. Generally try to not using 
mutex in HCALLs, but we need this mutex with these HCALLs.

We can add h_modify_vas_window() or get_vas_user_win_ref() with in the 
mutex context, but not needed. Also free HCALL can take longer depends 
on pending NX requests since the hypervisor waits for all requests to be 
completed before closing the window.

Applications can issue window open / free calls at the same time which 
can experience mutex contention especially on the large system where 
100's of credits are available. Another example: The migration event can 
wait longer (or timeout) to get this mutex if many threads issue 
open/free window calls. Hence added h_modify_vas_window() (modify HCALL) 
or get_vas_user_win_ref() outside of mutex.

Thanks
Haren










