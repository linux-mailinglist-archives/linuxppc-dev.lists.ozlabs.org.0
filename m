Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B588B314
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 22:47:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KrsZ3Dg+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3RPN3XNKz3dWr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 08:47:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KrsZ3Dg+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=igalia.com (client-ip=213.97.179.56; helo=fanzine2.igalia.com; envelope-from=mcanal@igalia.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2483 seconds by postgrey-1.37 at boromir; Tue, 26 Mar 2024 06:47:28 AEDT
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3NkS0pCGz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 06:47:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/cOCj+3wz4G6mk7yJiOWKe+zWsog28msEXqYEYYF/PM=; b=KrsZ3Dg+BwR2PxtUZN7tRdXRM/
	hzD6VT43T4jmCbBOlQa33Sar4qRrk34fr3Gcfdp4NQWyMpNKX4DH6J6albLyamFGb2CGEiZOtE5rW
	nfLSP5bRkADNvscY10NWmVllXMUJQDKsyuMyDODwaUtYaCGTGsGnQon7XaddORjvYOehlVXeE6sfa
	n/bIrGl+ZGAr/bWkdry+5ZKkzUgSzgmqpPyWvxvxDDYmJrN43CkrvCrpPuNbz7XsoF5Y7Liw6IIBe
	NgZRaSze46IWt9cBigdGv5ZmmlmhThf/TXsUVgjI26u4CbbOLSlCdcwSS/EtJiOUe4764vjuRvM+Q
	SpYZMTlA==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ropdK-00FBOo-Kv; Mon, 25 Mar 2024 20:05:23 +0100
Message-ID: <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
Date: Mon, 25 Mar 2024 16:05:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Guenter Roeck <linux@roeck-us.net>, linux-kselftest@vger.kernel.org
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
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
In-Reply-To: <20240325175248.1499046-6-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Mar 2024 08:47:15 +1100
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-sh@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <ak
 pm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Guenter,

On 3/25/24 14:52, Guenter Roeck wrote:
> The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> intentionally trigger warning backtraces by providing bad parameters to
> the tested functions. What is tested is the return value, not the existence
> of a warning backtrace. Suppress the backtraces to avoid clogging the
> kernel log.
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> 
>   drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index 76332cd2ead8..75614cb4deb5 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
>   
>   static void drm_test_rect_calc_hscale(struct kunit *test)
>   {
> +	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
>   	const struct drm_rect_scale_case *params = test->param_value;
>   	int scaling_factor;
>   
> +	START_SUPPRESSED_WARNING(drm_calc_scale);

I'm not sure if it is not that obvious only to me, but it would be nice
to have a comment here, remembering that we provide bad parameters in
some test cases.

Best Regards,
- Maíra

>   	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
>   					      params->min_range, params->max_range);
> +	END_SUPPRESSED_WARNING(drm_calc_scale);
>   
>   	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
>   }
>   
>   static void drm_test_rect_calc_vscale(struct kunit *test)
>   {
> +	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
>   	const struct drm_rect_scale_case *params = test->param_value;
>   	int scaling_factor;
>   
> +	START_SUPPRESSED_WARNING(drm_calc_scale);
>   	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
>   					      params->min_range, params->max_range);
> +	END_SUPPRESSED_WARNING(drm_calc_scale);
>   
>   	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
>   }
