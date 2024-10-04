Return-Path: <linuxppc-dev+bounces-1764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4AD990B2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 20:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKxkq656dz2xtN;
	Sat,  5 Oct 2024 04:23:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.165 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728066227;
	cv=pass; b=hAoOlLhmjG5oJFbSZkeP2QBQ6ltu8uvsxznYWvHmMyioVgwB4pwRXyHroI9AH70j9ZCZKTL3nmmBqwoXzoY9CQi+zfs58+UdlCrtc/DpU1Z9HeKftFXvm9eYoF3X6mT/HVtkBJ8CQnuItggBFWtOlyiDjUtmX0GfPmPFLSgBglkWloTDjA4knJtsvXdtxo1Fk88Ub0XCZq8Nr7BueR5D0z13rshp8zSBW3lHjVoJxxZkpaKXSAzaMjdAMbdE9LO2Bb6W/LnhF3+KhLltuM7oXC6qWQ4EjXJ1MTIwcpfLdM92ZujIYQ8DIRKIq3XyoUPNM5MzZxpare1apySDhIdyBA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728066227; c=relaxed/relaxed;
	bh=fh5lK3S2+T6zI5umkiU5AYrf63ArwtBPlfiCR8hznDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXjVdK+CmyFue5Loa/vl3r49KSKkX59Cavazk0lY4lJDSmvRxMu/qAY/6GOWz5Zc2j5roCvUKgXsOKtArgAPSoCJ1sgRagbnZJMgpKpZ8fjEnSigHDQpO530ITvN9cpXM+rmGLEwSiuq1ppfkSQWGsGknRt/thf+5SUtndGTZJrVsp+n4YIT01CG4NE2EBzKUC38YFJCZ3zCpIWXTqWmZu8E8RVzpUj4S4LyuNqKZwasz6mteWlmzyiva2WTWTDgHp9BmgHoNANbW+tfWdoABhx8JebV3CZZcCqrovzfmJBLdt/YWrsfFHQ8aEI66K7DiabLtqIqT9Mmr6+BwDuoGA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=p3rOZDzg; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cPrDotOU; dkim-atps=neutral; spf=pass (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=p3rOZDzg;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cPrDotOU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKxkk40MDz2xrv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 04:23:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1728066202; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ryuDJkyoAigBE+RjYWjHOwz8Thcg/gbb5fWaZSHOKf3JBmDgDoTeXz3xVdKujnkzl8
    R+SWtAHPD1GziAmZIjOmP/jPWL+X84TE7IeB7kg4kNOzDLylwqwmOYD5SYD7SA6JDaTx
    yVPfjPHrhNZArjZpXx3lm0B8HZtXcG00gvxxVFG+AVqH8SC8iMyuOrjCZJqNPfu55/i+
    OId08i3wIHDYgsOy7AL3GEPgDwuzI52EbKO0c6j1pUCohNtxMmnYAUFeMZZ6Jo51jUz9
    YXvOdPy4SfziFFzJEtdxeDdT0X9JfgI8AOeTvuzMmfk9WZucU1OZ3S9Y8jH9cKucX9Rg
    N4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728066202;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=fh5lK3S2+T6zI5umkiU5AYrf63ArwtBPlfiCR8hznDs=;
    b=cpYZO3RGAgzFip2LJ6xDfBHZMeM1zuDUDM2Vk6+Vb2B4rEOMjbOW07Z2xTsWTP8Xu6
    xYDEPYn7HVSpFjZ9MZ4hchhfzwY5GsSobHh0yDIqt5JFKU2+6G5hqsBjrAJaZfh32szy
    5I2qjpmcDj9ctG0xSAdlq38N/f3HokxgmpbTKi/VElEe1cDrgKZ0qgNsCW55YdWrSCjp
    oyoWec6QE2TzN5xW/LIHmxhnVIVzuLLHReErjR+4wTFN/IWppD22UVhMnHhxFR8CNQ9U
    CZXB4kHCYShrXcUQ7sH/4pV0FI1imTATdKPy7kVh4pnsLCcKYz7gBHZYwZO5rGXM1Z0f
    H8Fw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728066202;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=fh5lK3S2+T6zI5umkiU5AYrf63ArwtBPlfiCR8hznDs=;
    b=p3rOZDzgUeuNjjwRSaUcfaVPHXrMVMvdn2MkrRb+3WKWL1fkyB0L9WkitiF2tfEheo
    H7+NzvSZwpxiAG/vBhFIgL3FdGwIAPFRDPU3k+dsS6Sd4NilPuI3QzbopyoONEg9AygS
    koBB2JmRhdVygCTSE52rXEb72/Dvwg0HtzPMhgXchL+uymFEHBX+WsCtAxeeys39NgIb
    AZ5FcrzcYaZl1lMG1Yv4OxrLmCEqNSLooxCHkxHyXLgEqTPWbDYyi1dddhzGqDP6LIUr
    b9j6p7UJASIBdWdEBlgitL+lfgo9x9GNKtdYR6s+LNQfM20Dl42Xw94hzms4VMXuAkSw
    eOZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728066202;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=fh5lK3S2+T6zI5umkiU5AYrf63ArwtBPlfiCR8hznDs=;
    b=cPrDotOUMGIqIkpyrdwgVL/OvKnf2X+2HfYKDSbbZooT2v6gIAQ66Qn8b3ArRjUC1w
    rCaUNpTGk9m9F74AYhAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5jms33DCCl8yuj1GiXKxy2NgsIyNI7J6OEvKwI="
Received: from [IPV6:2a01:599:80b:670e:7ae4:fdea:aa8b:6a58]
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a094INKf8x
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 4 Oct 2024 20:23:20 +0200 (CEST)
Message-ID: <b758c87b-1ab3-4ce0-bc97-ac8fe9387c1b@xenosoft.de>
Date: Fri, 4 Oct 2024 20:24:21 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] drm/radeon: add late_register for connector - Please test
To: Alex Deucher <alexdeucher@gmail.com>, Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alex Deucher <alexander.deucher@amd.com>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>
References: <20241004010601.3387-1-wuhoipok@gmail.com>
 <CADnq5_Nt=8Lx6KOXHf0DHmqo2O7dYKDTfGCz-w_Hv+__=BqP9w@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CADnq5_Nt=8Lx6KOXHf0DHmqo2O7dYKDTfGCz-w_Hv+__=BqP9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi All,

I compiled a new RC1 of kernel 6.12 with this patch today. Please test it.

Downloads:

- https://github.com/chzigotzky/kernels/releases/tag/v6.12.0-rc1-2
- https://www.xenosoft.de/linux-image-6.12-rc1-2-X1000_X5000.tar.gz

Thanks,
Christian

On 04 October 2024 at 4:00pm, Alex Deucher wrote:
> On Thu, Oct 3, 2024 at 9:18 PM Wu Hoi Pok <wuhoipok@gmail.com> wrote:
>> The patch is to solve null dereference in 'aux.dev', which is
>> introduced in recent radeon rework. By having 'late_register',
>> the connector should be registered after 'drm_dev_register'
>> automatically, where in before it is the opposite.
>>
>> Fixes: 90985660ba48 ("drm/radeon: remove load callback from kms_driver")
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
> Applied.  Thanks!
>
> Alex
>
>> ---
>>   drivers/gpu/drm/radeon/atombios_dp.c       |  9 ++-------
>>   drivers/gpu/drm/radeon/radeon_connectors.c | 17 +++++++++++++++++
>>   2 files changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
>> index fca8b08535a5..6328627b7c34 100644
>> --- a/drivers/gpu/drm/radeon/atombios_dp.c
>> +++ b/drivers/gpu/drm/radeon/atombios_dp.c
>> @@ -228,10 +228,8 @@ void radeon_dp_aux_init(struct radeon_connector *radeon_connector)
>>   {
>>          struct drm_device *dev = radeon_connector->base.dev;
>>          struct radeon_device *rdev = dev->dev_private;
>> -       int ret;
>>
>>          radeon_connector->ddc_bus->rec.hpd = radeon_connector->hpd.hpd;
>> -       radeon_connector->ddc_bus->aux.dev = radeon_connector->base.kdev;
>>          radeon_connector->ddc_bus->aux.drm_dev = radeon_connector->base.dev;
>>          if (ASIC_IS_DCE5(rdev)) {
>>                  if (radeon_auxch)
>> @@ -242,11 +240,8 @@ void radeon_dp_aux_init(struct radeon_connector *radeon_connector)
>>                  radeon_connector->ddc_bus->aux.transfer = radeon_dp_aux_transfer_atom;
>>          }
>>
>> -       ret = drm_dp_aux_register(&radeon_connector->ddc_bus->aux);
>> -       if (!ret)
>> -               radeon_connector->ddc_bus->has_aux = true;
>> -
>> -       WARN(ret, "drm_dp_aux_register() failed with error %d\n", ret);
>> +       drm_dp_aux_init(&radeon_connector->ddc_bus->aux);
>> +       radeon_connector->ddc_bus->has_aux = true;
>>   }
>>
>>   /***** general DP utility functions *****/
>> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
>> index 528a8f3677c2..f9c73c55f04f 100644
>> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
>> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
>> @@ -1786,6 +1786,20 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
>>          return MODE_OK;
>>   }
>>
>> +static int
>> +radeon_connector_late_register(struct drm_connector *connector)
>> +{
>> +       struct radeon_connector *radeon_connector = to_radeon_connector(connector);
>> +       int r = 0;
>> +
>> +       if (radeon_connector->ddc_bus->has_aux) {
>> +               radeon_connector->ddc_bus->aux.dev = radeon_connector->base.kdev;
>> +               r = drm_dp_aux_register(&radeon_connector->ddc_bus->aux);
>> +       }
>> +
>> +       return r;
>> +}
>> +
>>   static const struct drm_connector_helper_funcs radeon_dp_connector_helper_funcs = {
>>          .get_modes = radeon_dp_get_modes,
>>          .mode_valid = radeon_dp_mode_valid,
>> @@ -1800,6 +1814,7 @@ static const struct drm_connector_funcs radeon_dp_connector_funcs = {
>>          .early_unregister = radeon_connector_unregister,
>>          .destroy = radeon_connector_destroy,
>>          .force = radeon_dvi_force,
>> +       .late_register = radeon_connector_late_register,
>>   };
>>
>>   static const struct drm_connector_funcs radeon_edp_connector_funcs = {
>> @@ -1810,6 +1825,7 @@ static const struct drm_connector_funcs radeon_edp_connector_funcs = {
>>          .early_unregister = radeon_connector_unregister,
>>          .destroy = radeon_connector_destroy,
>>          .force = radeon_dvi_force,
>> +       .late_register = radeon_connector_late_register,
>>   };
>>
>>   static const struct drm_connector_funcs radeon_lvds_bridge_connector_funcs = {
>> @@ -1820,6 +1836,7 @@ static const struct drm_connector_funcs radeon_lvds_bridge_connector_funcs = {
>>          .early_unregister = radeon_connector_unregister,
>>          .destroy = radeon_connector_destroy,
>>          .force = radeon_dvi_force,
>> +       .late_register = radeon_connector_late_register,
>>   };
>>
>>   void
>> --
>> 2.46.2
>>


