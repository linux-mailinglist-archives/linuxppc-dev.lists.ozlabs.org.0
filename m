Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C8694CF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 17:32:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFqdF5hcWz3cKG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 03:32:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=R4iTn6xH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=R4iTn6xH;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFqcH1L36z3bg5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 03:31:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bGNxZYPN8DFGD+DAyTWS3zPGWV5ykBQ5tFyV385U9oc=; b=R4iTn6xH8zDJTusokMQXuA5WPJ
	Oh+/9/zhQ1iGYv06sWa4L39n+21g1lSA8X0KLvTooiD4limw8fjBX+LzN6N2N9QBMDeVc67SFGS7j
	X/JXtkCSz3XcM8VXpeiEYXUFxm8F9U+pdp046JlHjG+uSepuEYVupTGDjAJ3AZ8kc587hFnyehufg
	m9k4/xBxDK8i2PX/3jJJKGMucsVX/12Dxx4EnBmOlvTqyFh8Ov+oNT3Ijyj29u7MUkaGdaxRl6Lfd
	aUzKLC6n14UuTVnhsiPJuObd+hsAyu+ZQcmxlqIvc3dSzpXeRrhhYfz6HpjQuLF5pKFF0B++FOLRC
	VUF4+4wg==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRbjk-005vGY-H6; Mon, 13 Feb 2023 16:31:29 +0000
Message-ID: <f8b1ef96-3d33-fa35-d99f-af00bf8c2e40@infradead.org>
Date: Mon, 13 Feb 2023 08:31:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/11] drivers/ps3: Read video= option with
 fb_get_option()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-5-tzimmermann@suse.de>
 <06917dd0-c4f1-c80a-16a7-f2baac47027d@infradead.org>
 <fedc746f-1685-a5a1-b847-7031b66c1fd2@suse.de>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <fedc746f-1685-a5a1-b847-7031b66c1fd2@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2/13/23 03:29, Thomas Zimmermann wrote:
> Am 12.02.23 um 17:53 schrieb Geoff Levand:
>> On 2/9/23 05:55, Thomas Zimmermann wrote:
>>> Get the kernel's global video= parameter with fb_get_option(). Done
>>> to unexport the internal fbdev state fb_mode_config. No functional
>>> changes.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/ps3/ps3av.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> I wanted to test these changes on the PS3, but got this
>> error when trying to apply this patch set to Linux-6.2-rc7:
>>
>>    Applying: fbdev: Handle video= parameter in video/cmdline.c
>>    error: patch failed: drivers/gpu/drm/Kconfig:10
>>    error: drivers/gpu/drm/Kconfig: patch does not apply
>>
>> Is there a Linux kernel revision that these will apply to,
>> or is there a git repository I can pull them from?
> 
> Thanks for testing.  My base version is a recent DRM development tree. The repo is at https://cgit.freedesktop.org/drm/drm-tip/, the branch is drm-tip.

I tested the drm-tip branch at c54b5fcf3e68 on PS3 and it
seemed to work OK.

Tested-by: Geoff Levand <geoff@infradead.org>

