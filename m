Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B99227F8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 14:03:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9y0X2zdfzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 22:03:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9xsf6XfXzDqlK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:57:10 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LBV9uI112011; Tue, 21 Jul 2020 07:56:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5k0x2ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 07:56:56 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LBWB61115046;
 Tue, 21 Jul 2020 07:56:55 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5k0x2da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 07:56:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LBtgVL008126;
 Tue, 21 Jul 2020 11:56:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh3sud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:56:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06LBupNK66584962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 11:56:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2A9842045;
 Tue, 21 Jul 2020 11:56:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF64242042;
 Tue, 21 Jul 2020 11:56:49 +0000 (GMT)
Received: from [9.79.210.59] (unknown [9.79.210.59])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 11:56:49 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] selftest/cpuidle: Add support for cpuidle latency
 measurement
To: ego@linux.vnet.ibm.com
References: <20200717091801.29289-1-psampat@linux.ibm.com>
 <20200717091801.29289-3-psampat@linux.ibm.com>
 <20200720055242.GB31497@in.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <9465ac64-1f24-fea5-6c57-59cce00a2ba8@linux.ibm.com>
Date: Tue, 21 Jul 2020 17:26:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200720055242.GB31497@in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_03:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=1 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210077
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
Cc: linux-pm@vger.kernel.org, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, paulus@samba.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, srivatsa@csail.mit.edu,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gautham, Thanks for the review.


On 20/07/20 11:22 am, Gautham R Shenoy wrote:
> Hi Pratik,
>
>
> On Fri, Jul 17, 2020 at 02:48:01PM +0530, Pratik Rajesh Sampat wrote:
>> This patch adds support to trace IPI based and timer based wakeup
>> latency from idle states
>>
>> Latches onto the test-cpuidle_latency kernel module using the debugfs
>> interface to send IPIs or schedule a timer based event, which in-turn
>> populates the debugfs with the latency measurements.
>>
>> Currently for the IPI and timer tests; first disable all idle states
>> and then test for latency measurements incrementally enabling each state
>>
>> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> A few comments below.
>
>> ---
>>   tools/testing/selftests/Makefile           |   1 +
>>   tools/testing/selftests/cpuidle/Makefile   |   6 +
>>   tools/testing/selftests/cpuidle/cpuidle.sh | 257 +++++++++++++++++++++
>>   tools/testing/selftests/cpuidle/settings   |   1 +
>>   4 files changed, 265 insertions(+)
>>   create mode 100644 tools/testing/selftests/cpuidle/Makefile
>>   create mode 100755 tools/testing/selftests/cpuidle/cpuidle.sh
>>   create mode 100644 tools/testing/selftests/cpuidle/settings
>>
> [..skip..]
>
>> +
>> +ins_mod()
>> +{
>> +	if [ ! -f "$MODULE" ]; then
>> +		printf "$MODULE module does not exist. Exitting\n"
> If the module has been compiled into the kernel (due to a
> localyesconfig, for instance), then it is unlikely that we will find
> it in /lib/modules. Perhaps you want to check if the debugfs
> directories created by the module exist, and if so, print a message
> saying that the modules is already loaded or some such?
>
That's a good idea. I can can grep for this module within /proc/modules
and not insert it, if it is already there

>> +		exit $ksft_skip
>> +	fi
>> +	printf "Inserting $MODULE module\n\n"
>> +	insmod $MODULE
>> +	if [ $? != 0 ]; then
>> +		printf "Insmod $MODULE failed\n"
>> +		exit $ksft_skip
>> +	fi
>> +}
>> +
>> +compute_average()
>> +{
>> +	arr=("$@")
>> +	sum=0
>> +	size=${#arr[@]}
>> +	for i in "${arr[@]}"
>> +	do
>> +		sum=$((sum + i))
>> +	done
>> +	avg=$((sum/size))
> It would be good to assert that "size" isn't 0 here.

Sure

>> +}
>> +
>> +# Disable all stop states
>> +disable_idle()
>> +{
>> +	for ((cpu=0; cpu<NUM_CPUS; cpu++))
>> +	do
>> +		for ((state=0; state<NUM_STATES; state++))
>> +		do
>> +			echo 1 > /sys/devices/system/cpu/cpu$cpu/cpuidle/state$state/disable
> So, on offlined CPUs, we won't see
> /sys/devices/system/cpu/cpu$cpu/cpuidle/state$state directory. You
> should probably perform this operation only on online CPUs.

Right. I should make CPU operations only on online CPUs all over the script

[..snip..]

Thanks
Pratik

