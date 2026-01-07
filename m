Return-Path: <linuxppc-dev+bounces-15354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E14CFC693
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 08:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmKh35cNrz2yFh;
	Wed, 07 Jan 2026 18:40:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767771619;
	cv=none; b=ip39F51lo+8KpQS8uc5+kzCeCK0U8mgGije5O//5HwHbzqia/UD8Q579OhxzKWmwUuAyh7VZtaD7tlrDc/1AHnmmk9PcEkPxV+11rZTMrtvaC8uGBmTUGzX9aKV2/pXxLkKenqq9m25HtJ52ZrmVtWtEEnUhnf9d1TrhP/ygSoOLwlQNjsYREH200hZs559HF89neSl241ViIhuFwapEuE7kpLm8vun0TsP1eSg3g4rEVCgy3sssMWDUvCNfK8VnIrvRF1I4gAGr73/VHFwl0X3jpWhELpywTnuJJ/aHn5adMZxaTd5yk93uQHwWD9JTiW5tJrQhaA8SRaktnyaWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767771619; c=relaxed/relaxed;
	bh=ooL1wAH4oPdafpfbjqfnQTjUCj6zRNCO0crYGwQGqOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkr+nAA4IeFmJAPh68Weo9MqL6izk4r7TlenR1Wv9TwdgAms3gsC0MDNvSk3FXxSoc74bHCF5XtA2t8ysf9WVAfE0qLByusZo2kiiqkJTeQdIWqim55iraAkioG/oyGaPcEwU/JBfhZeUBO3ENlsiI2gWWgBfvPq5dB2ZyQeiPP/LbmBEmO41ho2BLh5Z9Vg1+CKdCE9E0k/fYT7U7KGbQUix/uM0ADK5yReVxxz9pTnpp4Lay97HJOglN7xsN1RGmy7B09C+Eg+MBxGlREXVElt3sZLzst+/E7FbaH3C5a9c41ZyEp8GZM4pE1CfRMPeXbQNpm6ImjKYwHW1zPDWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PPbAo4iP; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PPbAo4iP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmKh26BR8z2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 18:40:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A077D436BA;
	Wed,  7 Jan 2026 07:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B250C4CEF7;
	Wed,  7 Jan 2026 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771586;
	bh=glPKfl8V1dLid4Uhk4Di9ZmvY/56MYsT7qi92tzjDvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PPbAo4iPQi8SviPCmjcUeHBWBS8QE7ieS/V5eEyLAvCvAB+kBWPvP1LplTZ1Xnflf
	 sqrXU3ULOiKZzqkETrLidsidrMEFWSxooIL3alcVfdFkLh3CIWe4K8suzrnxVBEGAY
	 Od6Mq0DXs+74pMgYgLePQYdREGlsF3drtjjvrD/9xRuOfJ4wvf+mF9KrDjHQ3QRK5k
	 2m917ZpmvD+Ko++w6oW0awrzcfOxVH9/f4PDywk4q8r6WK+B3Q41XhsKtTkxF/Li/U
	 lc9ZL07XWb4XEdTJRgGanFOnJCy3VoDY9oolxslROmuRc1MRH3UKs+WwLDiYEcllCX
	 vJSOWZCdBTPiw==
Message-ID: <a65f4add-f052-4c51-85e9-317b42802df1@kernel.org>
Date: Wed, 7 Jan 2026 08:39:41 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type
 declaration
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
 <2026010755-registrar-agreeably-a626@gregkh>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <2026010755-registrar-agreeably-a626@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ioana,

Le 07/01/2026 à 06:30, Greg Kroah-Hartman a écrit :
> On Tue, Jan 06, 2026 at 07:54:21PM +0100, Christophe Leroy (CS GROUP) wrote:
>> Fix following sparse warning:
>>
>>    CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
>> drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?
>>
>> As it is exported it can't be static. So declare it in mc.h like
>> all other similar objects.
>>
>> Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> ---
>>   include/linux/fsl/mc.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
>> index 897d6211c1635..28441a456bb48 100644
>> --- a/include/linux/fsl/mc.h
>> +++ b/include/linux/fsl/mc.h
>> @@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
>>   extern const struct device_type fsl_mc_bus_dpaiop_type;
>>   extern const struct device_type fsl_mc_bus_dpci_type;
>>   extern const struct device_type fsl_mc_bus_dpdmai_type;
>> +extern const struct device_type fsl_mc_bus_dpdbg_type;
> 
> As it's obviously not used anywhere, this should not be the fix, please
> just mark it static and remove the EXPORT_SYMBOL_GPL() as well.

What's your opinion here as Maintainer of this driver, what should we do ?

Greg is right that it is nowhere used, and it is the same for several 
other types, the only difference being that they have a matching 
is_fsl_mc_bus_dp..() helper that hides the type, but not all helpers are 
used, and many of them are not used outside drivers/bus/fsl-mc/ which 
cannot be built as a module:

$ git grep is_fsl_mc_bus_
drivers/bus/fsl-mc/dprc-driver.c:       if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/dprc-driver.c:       if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/fsl-mc-allocator.c:  return is_fsl_mc_bus_dpbp(mc_dev) ||
drivers/bus/fsl-mc/fsl-mc-allocator.c: 
is_fsl_mc_bus_dpmcp(mc_dev) ||
drivers/bus/fsl-mc/fsl-mc-allocator.c:         is_fsl_mc_bus_dpcon(mc_dev);
drivers/bus/fsl-mc/fsl-mc-allocator.c:  if (is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/fsl-mc-allocator.c:  if (is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/fsl-mc-bus.c:        if (is_fsl_mc_bus_dprc(mc_dev) ||
drivers/bus/fsl-mc/fsl-mc-bus.c:            is_fsl_mc_bus_dpmcp(mc_dev)) {
drivers/bus/fsl-mc/fsl-mc-bus.c:        } else if 
(is_fsl_mc_bus_dpio(mc_dev)) {
drivers/bus/fsl-mc/fsl-mc-bus.c:                        if 
(is_fsl_mc_bus_dprc(mc_dev) &&
drivers/bus/fsl-mc/fsl-mc-bus.c:        if (is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:              int no_mmap = 
is_fsl_mc_bus_dprc(mc_dev);
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if 
(is_fsl_mc_bus_dprc(vdev->mc_dev)) {
drivers/vfio/fsl-mc/vfio_fsl_mc.c:              if 
(is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (!is_fsl_mc_bus_dprc(mc_dev)) {
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (is_fsl_mc_bus_dprc(mc_dev))
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dprc(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpni(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpio(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpsw(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpdmux(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpbp(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpcon(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpmcp(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpmac(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dprtc(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpseci(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpdcei(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpaiop(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpci(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpdmai(const 
struct fsl_mc_device *mc_dev)

And the only outside user is drivers/vfio/fsl-mc/vfio_fsl_mc.c which can 
be a module, but has been orphaned by commit af6605f87ca5 ("MAINTAINERS: 
Orphan vfio fsl-mc bus driver") and scheduled for removal by commit 
1b1d9ca13475 ("vfio/fsl-mc: Mark for removal")

Christophe

