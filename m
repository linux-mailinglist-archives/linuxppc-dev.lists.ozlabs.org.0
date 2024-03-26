Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A1088B692
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:11:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=rhJ7uKz/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Wvw3CRHz3cZM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 12:11:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=rhJ7uKz/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=igalia.com (client-ip=213.97.179.56; helo=fanzine2.igalia.com; envelope-from=mcanal@igalia.com; receiver=lists.ozlabs.org)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3Wv64TNCz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 12:10:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2+G6lqjrPiGO7sJw8UoeY7bYbprZSC43xVHllYnfJhk=; b=rhJ7uKz/jNbiljxVy2Ig0qkt0g
	kvpuUE1lPLbwPzGEmAlvqhxspbyqAuhp3lvVu2/0lRADtNrnqN1QVyowSfck4x7sswZ3Mf2c+isL5
	JHZn0pHwYrSeW216yn4KsRHK18declY467zYpe1aGEz4NXQ34ztnSOhzbkext8kKJgZdEYIA3CDQl
	MqJkCcu19SKuJctfquerQaSbPbb9T0JPq0vVllSSIHhmlX5nSZbHfYt1w1RnUNz1OMZqjwluyIgKJ
	Z/NwN46y340x2/yIZMUl99PpWvJ+BJHNP4LRLQigoe4+IwdjCfowt9nl3g3oxJgDc06FTbUHhayoY
	+ROL5mmQ==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rovJx-00FHd6-1x; Tue, 26 Mar 2024 02:09:45 +0100
Message-ID: <7f6a223f-f432-4e1b-a67e-3816448224a1@igalia.com>
Date: Mon, 25 Mar 2024 22:09:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Guenter Roeck <linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
 <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-sh@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimme
 rmann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/25/24 16:24, Guenter Roeck wrote:
> Hi,
> 
> On Mon, Mar 25, 2024 at 04:05:06PM -0300, Maíra Canal wrote:
>> Hi Guenter,
>>
>> On 3/25/24 14:52, Guenter Roeck wrote:
>>> The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
>>> intentionally trigger warning backtraces by providing bad parameters to
>>> the tested functions. What is tested is the return value, not the existence
>>> of a warning backtrace. Suppress the backtraces to avoid clogging the
>>> kernel log.
>>>
>>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> - Rebased to v6.9-rc1
>>> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>>>
>>>    drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
>>> index 76332cd2ead8..75614cb4deb5 100644
>>> --- a/drivers/gpu/drm/tests/drm_rect_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
>>> @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
>>>    static void drm_test_rect_calc_hscale(struct kunit *test)
>>>    {
>>> +	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
>>>    	const struct drm_rect_scale_case *params = test->param_value;
>>>    	int scaling_factor;
>>> +	START_SUPPRESSED_WARNING(drm_calc_scale);
>>
>> I'm not sure if it is not that obvious only to me, but it would be nice
>> to have a comment here, remembering that we provide bad parameters in
>> some test cases.
> 
> Sure. Something like this ?
> 
>          /*
>           * drm_rect_calc_hscale() generates a warning backtrace whenever bad
>           * parameters are passed to it. This affects all unit tests with an
>           * error code in expected_scaling_factor.
>           */
> 

Yeah, perfect. With that, feel free to add my

Acked-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> Thanks,
> Guenter
