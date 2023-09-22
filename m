Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB26E7AAD31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:54:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsR0v3qwWz3dxP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:54:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=3zpk=fg=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsR0P55dhz3cRv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:54:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A33EB822AB;
	Fri, 22 Sep 2023 08:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826D3C433C8;
	Fri, 22 Sep 2023 08:54:20 +0000 (UTC)
Message-ID: <c3d08bc5-49af-4967-8d06-572219cad9de@xs4all.nl>
Date: Fri, 22 Sep 2023 10:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 09/11] media: uapi: Add
 V4L2_CID_USER_IMX_ASRC_RATIO_MOD control
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
 <fbedcbf1-d925-47d6-b9fb-c9e15263c117@xs4all.nl>
 <CAA+D8APyNGFSry1GUv6TOW0nKYHKSwQd5bTcRNuT7cu0Xf8eUA@mail.gmail.com>
 <5292ce53-643e-44f0-b2cc-cb66efee9712@xs4all.nl>
 <CAA+D8AMZN59uTRs2sOrSeVb5AGopTzurNVCTNwJOVPahfEXd+w@mail.gmail.com>
 <2d44d574-08e5-4db3-87d9-5d12657f8935@xs4all.nl>
 <CAA+D8AN+Uz+3CN9BnD5R_gp5opD1v-D8FBjANRpGrH43Ac2tdg@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <CAA+D8AN+Uz+3CN9BnD5R_gp5opD1v-D8FBjANRpGrH43Ac2tdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On 22/09/2023 04:51, Shengjiu Wang wrote:
> On Thu, Sep 21, 2023 at 10:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 21/09/2023 13:13, Shengjiu Wang wrote:
>>> On Thu, Sep 21, 2023 at 3:11 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> On 21/09/2023 08:55, Shengjiu Wang wrote:
>>>>> On Wed, Sep 20, 2023 at 6:19 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>>>
>>>>>> On 20/09/2023 11:32, Shengjiu Wang wrote:
>>>>>>> The input clock and output clock may not be the accurate
>>>>>>> rate as the sample rate, there is some drift, so the convert
>>>>>>> ratio of i.MX ASRC module need to be changed according to
>>>>>>> actual clock rate.
>>>>>>>
>>>>>>> Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
>>>>>>> adjust the ratio.
>>>>>>>
>>>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>>>>> ---
>>>>>>>  Documentation/userspace-api/media/v4l/control.rst | 5 +++++
>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
>>>>>>>  include/uapi/linux/v4l2-controls.h                | 1 +
>>>>>>>  3 files changed, 7 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
>>>>>>> index 4463fce694b0..2bc175900a34 100644
>>>>>>> --- a/Documentation/userspace-api/media/v4l/control.rst
>>>>>>> +++ b/Documentation/userspace-api/media/v4l/control.rst
>>>>>>> @@ -318,6 +318,11 @@ Control IDs
>>>>>>>      depending on particular custom controls should check the driver name
>>>>>>>      and version, see :ref:`querycap`.
>>>>>>>
>>>>>>> +.. _v4l2-audio-imx:
>>>>>>> +
>>>>>>> +``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
>>>>>>> +    sets the rasampler ratio modifier of i.MX asrc module.
>>>>>>
>>>>>> rasampler -> resampler (I think?)
>>>>>>
>>>>>> This doesn't document at all what the type of the control is or how to interpret it.
>>>>>>
>>>>>>> +
>>>>>>>  Applications can enumerate the available controls with the
>>>>>>>  :ref:`VIDIOC_QUERYCTRL` and
>>>>>>>  :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>>> index 8696eb1cdd61..16f66f66198c 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>>> @@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>>>       case V4L2_CID_COLORIMETRY_CLASS:        return "Colorimetry Controls";
>>>>>>>       case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:               return "HDR10 Content Light Info";
>>>>>>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:      return "HDR10 Mastering Display";
>>>>>>> +     case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:                  return "ASRC RATIO MOD";
>>>>>>
>>>>>> Let's stay consistent with the other control names:
>>>>>>
>>>>>> "ASRC Ratio Modifier"
>>>>>>
>>>>>> But if this is a driver specific control, then this doesn't belong here.
>>>>>>
>>>>>> Driver specific controls are defined in the driver itself, including this
>>>>>> description.
>>>>>>
>>>>>> Same for the control documentation: if it is driver specific, then that
>>>>>> typically is documented either in a driver-specific public header, or
>>>>>> possibly in driver-specific documentation (Documentation/admin-guide/media/).
>>>>>>
>>>>>> But is this imx specific? Wouldn't other similar devices need this?
>>>>>
>>>>> It is imx specific.
>>>>
>>>> Why? I'm not opposed to this, but I wonder if you looked at datasheets of
>>>> similar devices from other vendors: would they use something similar?
>>>
>>> I tried to find some datasheets for other vendors, but failed to find them.
>>> So I don't know how they implement this part.
>>>
>>> Ratio modification on i.MX is to modify the configured ratio.
>>> For example, the input rate is 44.1kHz,  output rate is 48kHz,
>>> configured ratio = 441/480,   the ratio modification is to modify
>>> the fractional part of (441/480) with small steps.  because the
>>> input clock or output clock has drift in the real hardware.
>>> The ratio modification is signed value, it is added to configured
>>> ratio.
>>>
>>> In our case, we have some sysfs interface for user to get the
>>> clock from input audio device and output audio device, user
>>> need to calculate the ratio dynamically , then configure the
>>> modification to driver
>>
>> So this ratio modifier comes into play when either the audio input
>> or audio output (or both) are realtime audio inputs/outputs where
>> the sample rate is not a perfect 44.1 or 48 kHz, but slightly different?
> 
> yes.
> 
>>
>> If you would use this resampler to do offline resampling (i.e. resample
>> a 44.1 kHz wav file to a 48 kHz wav file), then this wouldn't be needed,
>> correct?
> 
> yes.
> 
>>
>> When dealing with realtime audio, userspace will know how to get the
>> precise sample rate, but that is out-of-scope of this driver. Here
>> you just need a knob to slightly tweak the resampling ratio.
>>
>> If my understanding is correct, then I wonder if it is such a good
>> idea to put the rate into the v4l2_audio_format: it really has nothing
>> to do with the audio format as it is stored in memory.
>>
>> What if you would drop that 'rate' field and instead create just a single
>> control for the resampling ratio. This can use struct v4l2_fract to represent
>> a fraction. It would be more work since v4l2_fract is currently not supported
>> for controls, but it is not hard to add support for that (just a bit tedious)
>> and I actually think this might be a perfect solution.
>>
>> That way userspace can quite precisely tweak the ratio on the fly, and
>> it is a generic solution as well instead of mediatek specific.
>>
> 
> (rate, channel, format) are the basic parameters for audio stream.
> For example, if there is decoder/encoder requirement, the rate field is
> still needed,  I think the rate shouldn't be removed.

The v4l2_format struct is meant to describe the format of the data in memory,
not the rate at which the data has to be processed. It is the same for video:
v4l2_format describes the memory layout of the video data, not the framerate.
That is done through other ioctls (VIDIOC_S/G_PARM, a horrible ioctl, but
that's another story). So for audio the channel and format fields define how
the audio data is laid out in memory, but the rate has nothing to do with
that.

For this resampler you don't even need the rate at all, all you need is the
rate ratio, right? I.e. there is no difference when resampling from 10 kHz to 20 kHz
vs. 30 kHz to 60 kHz, the ratio is the same.

Or is that too simplistic and the hardware needs the actual rates as well?

Remember that I am a video guy, not an audio guy, so apologies if I ask stupid
questions!

Regardless, I don't believe the rate belongs to the audio format struct. It's
not how v4l2_format works. If the rate is needed, then that is probably best
done through controls, one for the source (output queue) and one for the
destination (capture queue).

Regards,

	Hans

> 
> tweak ratio is not always needed by use case. As you said, for
> file to file conversion, it is not needed, so keeping 'rate' is necessary.
> 
> best regards
> wang shengjiu
> 
>> Regards,
>>
>>         Hans
>>
>>>
>>> May be other vendors has similar implementation. or make
>>> the definition be generic is an option.
>>>
>>> best regards
>>> wang shengjiu
>>>
>>>>
>>>> And the very short description you gave in the commit log refers to input
>>>> and output clock: how would userspace know those clock frequencies? In
>>>> other words, what information does userspace need in order to set this
>>>> control correctly? And is that information actually available? How would
>>>> you use this control?
>>>>
>>>> I don't really understand how this is supposed to be used.
>>>>
>>>>>
>>>>> Does this mean that I need to create a header file in include/uapi/linux
>>>>> folder to put this definition?  I just hesitate if this is necessary.
>>>>
>>>> Yes, put it there. There are some examples of this already:
>>>>
>>>> include/uapi/linux/aspeed-video.h
>>>> include/uapi/linux/max2175.h
>>>>
>>>>>
>>>>> There is folder Documentation/userspace-api/media/drivers/ for drivers
>>>>> Should this document in this folder, not in the
>>>>> Documentation/admin-guide/media/?
>>>>
>>>> Yes, you are correct. For the headers above, the corresponding documentation
>>>> is in:
>>>>
>>>> Documentation/userspace-api/media/drivers/aspeed-video.rst
>>>> Documentation/userspace-api/media/drivers/max2175.rst
>>>>
>>>> So you have some examples as reference.
>>>>
>>>> Frankly, what is in admin-guide and in userspace-api is a bit random, it
>>>> probably could use a cleanup.
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>>
>>>>>
>>>>> Best regards
>>>>> Wang shengjiu
>>>>>>
>>>>>>>       default:
>>>>>>>               return NULL;
>>>>>>>       }
>>>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>>>>>> index c3604a0a3e30..b1c319906d12 100644
>>>>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>>>>> @@ -162,6 +162,7 @@ enum v4l2_colorfx {
>>>>>>>  /* The base for the imx driver controls.
>>>>>>>   * We reserve 16 controls for this driver. */
>>>>>>>  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USER_BASE + 0x10b0)
>>>>>>> +#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD     (V4L2_CID_USER_IMX_BASE + 0)
>>>>>>>
>>>>>>>  /*
>>>>>>>   * The base for the atmel isc driver controls.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>>         Hans
>>>>
>>

