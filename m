Return-Path: <linuxppc-dev+bounces-7411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3416AA77A1B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 13:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRmbN3ypfz2yVV;
	Tue,  1 Apr 2025 22:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743508384;
	cv=none; b=HKgIrNimb4IhXn6I5Eh9egujEK9IJOmxILnkHsiU3Zz9beZZ3weXb5K9kBSwyw/79tJPKX2TKOMJjMo84sGP428RujrpNyJfKvbJRtm1bzalYrdk6Dap10lJE+gETsYdyrOvV+wFqDnk1K8r1eLljvZ3z5l/E/j5WcwN8E7DLDSCUNfDttjPSk9vO1p+lVPuX66FAQMmymNaX4hZ3p3sAFQW4/2985kWWe6SknU+iBMf3nQvolo3j39+TcGPNAiVpvlTVQKOmKB2u7bV7ZKPGc9flJ9C783rewvTjPwzV0csbSRdJC88wdrWa5Xrbbnhph1WKOrvNyrZfHGD0KEJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743508384; c=relaxed/relaxed;
	bh=jkH9MDM8OgZyTlbT0rSNsiuPV2xBPqaeIED0uLLAzGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwYNZrg65V3eXIDnmHLVI971bpdH5zAyUOpALWalU5uhe0YbICbNTBkLipyl1PTTfCZM5vaQ9JRL+sTOD2OfIe4lJWZxstLxgH4uKxl9M08Y5xdgokvfSMD7S/pTgTrlfPw4zFkU+4CqvHPeYSkYl7RhLLIt9t6iX1wuLwjca4ie8FVYV0n9R7ksEGxltqlQkMaEW1w74hBrxGLcHVOgfLASrq3mmDecB0cItxw5iY3uPnTA2A2AS7uaKFi4p/CWoWavxM+co7v6mkV/0p/ofN3gI1z5g8n3MAh08orh8vs6v9oJGtHZ7BY9j2xBrTyArED3KzyP5yYWZeCTDABi3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GovLrEPw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OA0OGJHe; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GovLrEPw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OA0OGJHe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRmbM0v0Wz2ySc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 22:53:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743508376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jkH9MDM8OgZyTlbT0rSNsiuPV2xBPqaeIED0uLLAzGU=;
	b=GovLrEPwm/wS+xDUxEXfmu8UcgZntfMO86tvgDcmo3tBsZroz+gXdpP/gHmkGfZOFTagXK
	agzYRPVu9LN7waK2IlpUyk26yjE8TWm53lPSnBbQQ/JwFh98KidQi+oWbLZr/ofjdr6aEv
	nTW2fPrKKk7UWAskQaGz5FzjDpN5zQQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743508377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jkH9MDM8OgZyTlbT0rSNsiuPV2xBPqaeIED0uLLAzGU=;
	b=OA0OGJHe+IMw3fq7aEq05185zbJGcbMJOaPM9NN9pkNHvpHPYLslF3Goq1tsUJlZABb9km
	Rbt33k/f/6YAaUkrfQ/2H+MqTQdtMLy2GDiByHx87BH6lCX2c1/j/5eenQIfx8Wy4T+neX
	NCYstmJcXw9gIrYq1bYQB9z4GSvY43Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-WxAV860SPfyHU5IYEEK6UA-1; Tue, 01 Apr 2025 07:52:55 -0400
X-MC-Unique: WxAV860SPfyHU5IYEEK6UA-1
X-Mimecast-MFC-AGG-ID: WxAV860SPfyHU5IYEEK6UA_1743508374
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ea256f039so12793535e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Apr 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508374; x=1744113174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkH9MDM8OgZyTlbT0rSNsiuPV2xBPqaeIED0uLLAzGU=;
        b=id10Nuk5B0bL78wS6vAuJdmoXicpcKg9P4jXXHvNr2GdXV0UHXHlx29K2MnVVtWdNk
         K2ibtcRWMk75fNn7k0Z1tgBTSUleQo4LbA9Mc32yTXFIWhLrZZjDZYCgFiTEXPp7nGOG
         edGf33hqVLw/XZfPvtVuzXoDLKmIsOYmommAWszz36mAYdESIRsb2qiltZoAu76kclJB
         2oALjPnQ//E8A6wKAWIFrqJCFEEz0hiTZrK19Ta7HV1TeuJky2z/i+uE0WTktndaR/24
         Bgzx7EtM1EmLLHCzGuWu5lxHOJFOk+jofubqoUFu/sXHYezd435RonTLhDRmLUMztWd7
         Wt2Q==
X-Gm-Message-State: AOJu0YwvTbKLHdodbGOxM+XIzqtrb7cjEx4/7flL3jQZ6RKUXkTzRIct
	5iZas5xMVfkP01TAtZSiY4+HJ2XgzRrWobnjqpMELnXSQWmLL7hpkMY2jCWQa5I8YTjpuMMTl8i
	AFE2kqMDIuxu3cLriyabHoXFxs0kl6hcPOf03cNe+C4wtM+c6Kk6JiOgyQbvYoUM=
X-Gm-Gg: ASbGnctBiMcS+P80+TMZKUK8z1kiygguSqRV/aJmJbFufG0cUuhIEmOpQwe9PNc4pPO
	ldDa1c/NWQu9Ap2nlmvavRuCTvE216t8EhaZAsSSuJrIl2ML0Go1gAriKe5QwhqYQ2Ueq15Ic2G
	NKHgMyx5mwCLCJN/1rex4mHN/3Jq2BHTHsJfwgdzES+XduQSwLa6rlJdadJ3Pl/p8GZoafKl/Vy
	Qc08jN2ZuyoLKRHXea2VjSBM3vTo2TaEh5xRYn+90FLZwBJo3i6hRbxOnYxcS8Z/V4M1hTpjY5W
	LYe1kEqRDdGYPE4OyRKPNtr8Kuz8MqKcrCo+IF6Xrtn4SQ==
X-Received: by 2002:a05:6000:4203:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-39c120c8e66mr10278909f8f.8.1743508373870;
        Tue, 01 Apr 2025 04:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVyFMvMMFyiAxtgXRX3AjletpHTEVLtTxo7DaN41Y9GMmZ+nYfrUoc4eH5cPS4yTs3hMsIfw==
X-Received: by 2002:a05:6000:4203:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-39c120c8e66mr10278895f8f.8.1743508373446;
        Tue, 01 Apr 2025 04:52:53 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e311sm14029473f8f.78.2025.04.01.04.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 04:52:53 -0700 (PDT)
Message-ID: <9d90b5e4-bd6d-4d78-a1c5-044621c06c96@redhat.com>
Date: Tue, 1 Apr 2025 13:52:51 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ibmveth: make veth_pool_store stop hanging
To: davemarq@linux.ibm.com, netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Nick Child <nnac123@linux.ibm.com>
References: <20250331212328.109496-1-davemarq@linux.ibm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250331212328.109496-1-davemarq@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wbS4jJVp3dHVP5rd6Vvd3Y7yw3MJ9OyplVhnuqrrkr8_1743508374
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,WEIRD_PORT
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/31/25 11:23 PM, davemarq@linux.ibm.com wrote:
> From: Dave Marquardt <davemarq@linux.ibm.com>
> 
> Use rtnl_mutex to synchronize veth_pool_store with itself,
> ibmveth_close and ibmveth_open, preventing multiple calls in a row to
> napi_disable.
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> Fixes: 860f242eb534 ("[PATCH] ibmveth change buffer pools dynamically")
> Reviewed-by: Nick Child <nnac123@linux.ibm.com>
> ---
> In working on removing BUG_ON calls from ibmveth, I realized that 2
> threads could call veth_pool_store through writing to
> /sys/devices/vio/30000002/pool*/*. You can do this easily with a little
> shell script.
> 
> Running on a 6.14 kernel, I saw a hang:
> 
>     [  243.683282][  T108] INFO: task stress.sh:5829 blocked for more than 122 seconds.
>     [  243.683300][  T108]       Not tainted 6.14.0-01103-g2df0c02dab82 #3
>     [  243.683303][  T108] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>     [  366.563278][  T108] INFO: task stress.sh:5829 blocked for more than 245 seconds.
>     [  366.563297][  T108]       Not tainted 6.14.0-01103-g2df0c02dab82 #3
>     [  366.563301][  T108] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 
> I configured LOCKDEP, compiled ibmveth.c with DEBUG, and built a new
> kernel. I ran the test again and saw:
> 
>     Setting pool0/active to 0
>     Setting pool1/active to 1
>     [   73.911067][ T4365] ibmveth 30000002 eth0: close starting
>     Setting pool1/active to 1
>     Setting pool1/active to 0
>     [   73.911367][ T4366] ibmveth 30000002 eth0: close starting
>     [   73.916056][ T4365] ibmveth 30000002 eth0: close complete
>     [   73.916064][ T4365] ibmveth 30000002 eth0: open starting
>     [  110.808564][  T712] systemd-journald[712]: Sent WATCHDOG=1 notification.
>     [  230.808495][  T712] systemd-journald[712]: Sent WATCHDOG=1 notification.
>     [  243.683786][  T123] INFO: task stress.sh:4365 blocked for more than 122 seconds.
>     [  243.683827][  T123]       Not tainted 6.14.0-01103-g2df0c02dab82-dirty #8
>     [  243.683833][  T123] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>     [  243.683838][  T123] task:stress.sh       state:D stack:28096 pid:4365  tgid:4365  ppid:4364   task_flags:0x400040 flags:0x00042000
>     [  243.683852][  T123] Call Trace:
>     [  243.683857][  T123] [c00000000c38f690] [0000000000000001] 0x1 (unreliable)
>     [  243.683868][  T123] [c00000000c38f840] [c00000000001f908] __switch_to+0x318/0x4e0
>     [  243.683878][  T123] [c00000000c38f8a0] [c000000001549a70] __schedule+0x500/0x12a0
>     [  243.683888][  T123] [c00000000c38f9a0] [c00000000154a878] schedule+0x68/0x210
>     [  243.683896][  T123] [c00000000c38f9d0] [c00000000154ac80] schedule_preempt_disabled+0x30/0x50
>     [  243.683904][  T123] [c00000000c38fa00] [c00000000154dbb0] __mutex_lock+0x730/0x10f0
>     [  243.683913][  T123] [c00000000c38fb10] [c000000001154d40] napi_enable+0x30/0x60
>     [  243.683921][  T123] [c00000000c38fb40] [c000000000f4ae94] ibmveth_open+0x68/0x5dc
>     [  243.683928][  T123] [c00000000c38fbe0] [c000000000f4aa20] veth_pool_store+0x220/0x270
>     [  243.683936][  T123] [c00000000c38fc70] [c000000000826278] sysfs_kf_write+0x68/0xb0
>     [  243.683944][  T123] [c00000000c38fcb0] [c0000000008240b8] kernfs_fop_write_iter+0x198/0x2d0
>     [  243.683951][  T123] [c00000000c38fd00] [c00000000071b9ac] vfs_write+0x34c/0x650
>     [  243.683958][  T123] [c00000000c38fdc0] [c00000000071bea8] ksys_write+0x88/0x150
>     [  243.683966][  T123] [c00000000c38fe10] [c0000000000317f4] system_call_exception+0x124/0x340
>     [  243.683973][  T123] [c00000000c38fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>     ...
>     [  243.684087][  T123] Showing all locks held in the system:
>     [  243.684095][  T123] 1 lock held by khungtaskd/123:
>     [  243.684099][  T123]  #0: c00000000278e370 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x50/0x248
>     [  243.684114][  T123] 4 locks held by stress.sh/4365:
>     [  243.684119][  T123]  #0: c00000003a4cd3f8 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x88/0x150
>     [  243.684132][  T123]  #1: c000000041aea888 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x154/0x2d0
>     [  243.684143][  T123]  #2: c0000000366fb9a8 (kn->active#64){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x160/0x2d0
>     [  243.684155][  T123]  #3: c000000035ff4cb8 (&dev->lock){+.+.}-{3:3}, at: napi_enable+0x30/0x60
>     [  243.684166][  T123] 5 locks held by stress.sh/4366:
>     [  243.684170][  T123]  #0: c00000003a4cd3f8 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x88/0x150
>     [  243.684183][  T123]  #1: c00000000aee2288 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x154/0x2d0
>     [  243.684194][  T123]  #2: c0000000366f4ba8 (kn->active#64){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x160/0x2d0
>     [  243.684205][  T123]  #3: c000000035ff4cb8 (&dev->lock){+.+.}-{3:3}, at: napi_disable+0x30/0x60
>     [  243.684216][  T123]  #4: c0000003ff9bbf18 (&rq->__lock){-.-.}-{2:2}, at: __schedule+0x138/0x12a0
> 
> From the ibmveth debug, two threads are calling veth_pool_store, which
> calls ibmveth_close and ibmveth_open. Here's the sequence:
> 
>   T4365             T4366             
>   ----------------- ----------------- ---------
>   veth_pool_store   veth_pool_store   
>                     ibmveth_close     
>   ibmveth_close                       
>   napi_disable                        
>                     napi_disable      
>   ibmveth_open                        
>   napi_enable                         <- HANG
> 
> ibmveth_close calls napi_disable at the top and ibmveth_open calls
> napi_enable at the top.
> 
> https://docs.kernel.org/networking/napi.html]] says
> 
>   The control APIs are not idempotent. Control API calls are safe
>   against concurrent use of datapath APIs but an incorrect sequence of
>   control API calls may result in crashes, deadlocks, or race
>   conditions. For example, calling napi_disable() multiple times in a
>   row will deadlock.
> 
> In the normal open and close paths, rtnl_mutex is acquired to prevent
> other callers. This is missing from veth_pool_store. Use rtnl_mutex in
> veth_pool_store fixes these hangs.

Some/most of the above should actually land into the commit message,
please rewrite it accordingly.

>  drivers/net/ethernet/ibm/ibmveth.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index b619a3ec245b..77ef19a53e72 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -1802,18 +1802,24 @@ static ssize_t veth_pool_store(struct kobject *kobj, struct attribute *attr,
>  	long value = simple_strtol(buf, NULL, 10);
>  	long rc;
>  
> +	rtnl_lock();
> +
>  	if (attr == &veth_active_attr) {
>  		if (value && !pool->active) {
>  			if (netif_running(netdev)) {
>  				if (ibmveth_alloc_buffer_pool(pool)) {
>  					netdev_err(netdev,
>  						   "unable to alloc pool\n");
> +					rtnl_unlock();
>  					return -ENOMEM;
>  				}
>  				pool->active = 1;
>  				ibmveth_close(netdev);
> -				if ((rc = ibmveth_open(netdev)))
> +				rc = ibmveth_open(netdev);
> +				if (rc) {
> +					rtnl_unlock();
>  					return rc;

If you avoid a bit of duplicate code with
					goto unlock_err;

// at the end of the function
unlock_err:
	rtnl_unlock();
	return rc;


Cheers,

Paolo


