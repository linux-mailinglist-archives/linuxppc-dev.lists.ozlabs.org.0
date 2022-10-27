Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56760F147
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 09:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Myd0k4P2xz3cCd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 18:41:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Myd070Zn1z2yy7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 18:41:10 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MyctL3Nh6z15M19;
	Thu, 27 Oct 2022 15:36:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 15:41:04 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 15:41:04 +0800
Subject: Re: [PATCH] ALSA: aoa: i2sbus: fix possible memory leak in
 i2sbus_add_dev()
To: Takashi Iwai <tiwai@suse.de>
References: <20221027013438.991920-1-yangyingliang@huawei.com>
 <87r0ytojos.wl-tiwai@suse.de>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <91e667bb-b6dd-4966-eba6-31de4f2b56a7@huawei.com>
Date: Thu, 27 Oct 2022 15:41:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87r0ytojos.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, johannes@sipsolutions.net, perex@perex.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022/10/27 14:38, Takashi Iwai wrote:
> On Thu, 27 Oct 2022 03:34:38 +0200,
> Yang Yingliang wrote:
>> dev_set_name() in soundbus_add_one() allocates memory for name, it need be
>> freed when of_device_register() fails, call soundbus_dev_put() to give up
>> the reference that hold in device_initialize(), so that it can be freed in
>> kobject_cleanup() when the refcount hit to 0. And other resources are also
>> freed in i2sbus_release_dev(), so it can return 0 directly.
>>
>> Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> The check of kobj state is awkward, but it seems to be the simplest
> way...  Applied now.  Thanks!

Indeed, it's awkward, shall we introduce a helper like this:

diff --git a/sound/aoa/soundbus/i2sbus/core.c 
b/sound/aoa/soundbus/i2sbus/core.c
index f6841daf9e3b..950c37e0297e 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -302,7 +302,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,

         if (soundbus_add_one(&dev->sound)) {
                 printk(KERN_DEBUG "i2sbus: device registration error!\n");
-               if (dev->sound.ofdev.dev.kobj.state_initialized) {
+               if (soundbus_dev_initialized(&dev->sound)) {
                         soundbus_dev_put(&dev->sound);
                         return 0;
                 }
diff --git a/sound/aoa/soundbus/soundbus.h b/sound/aoa/soundbus/soundbus.h
index 3a99c1f1a3ca..2c9c95cf156a 100644
--- a/sound/aoa/soundbus/soundbus.h
+++ b/sound/aoa/soundbus/soundbus.h
@@ -174,6 +174,10 @@ struct soundbus_dev {

  extern int soundbus_add_one(struct soundbus_dev *dev);
  extern void soundbus_remove_one(struct soundbus_dev *dev);
+static inline bool soundbus_dev_initialized(struct soundbus_dev *dev)
+{
+       return dev->ofdev.dev.kobj.state_initialized;
+}


Thanks,
Yang
>
>
> Takashi
>
>
>> ---
>>   sound/aoa/soundbus/i2sbus/core.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
>> index faf6b03131ee..f6841daf9e3b 100644
>> --- a/sound/aoa/soundbus/i2sbus/core.c
>> +++ b/sound/aoa/soundbus/i2sbus/core.c
>> @@ -302,6 +302,10 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>>   
>>   	if (soundbus_add_one(&dev->sound)) {
>>   		printk(KERN_DEBUG "i2sbus: device registration error!\n");
>> +		if (dev->sound.ofdev.dev.kobj.state_initialized) {
>> +			soundbus_dev_put(&dev->sound);
>> +			return 0;
>> +		}
>>   		goto err;
>>   	}
>>   
>> -- 
>> 2.25.1
>>
> .
