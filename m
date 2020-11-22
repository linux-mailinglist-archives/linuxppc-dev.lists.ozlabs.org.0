Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA62BC7AF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Nov 2020 19:15:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfJNk40yqzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 05:15:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=WDjFbtXM; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfJLl3rCqzDqP4;
 Mon, 23 Nov 2020 05:13:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:Cc:From:References:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=OAzAw/eat4OIPvzJDoVFVdRswxGI5un7B+I2LBW7FKE=; b=WDjFbtXMAxFQaTnzWVpmjxn6T7
 8u86rEkEWDU20FFH6htb8+zxcIgZjgodTzwx9oL2BOoInmNe47le5lJo5feDNQo0kn/MIjJ5bcPT5
 uADwfu6EHqwcVoaDmaNuQQMWkYtHCJlDwF87R1/4d2hbu/iwWt6JGTagWHxZqI3aM+z3v/os1bRVj
 DeITX6xVnwiqiTdQdf2E2B7o1WfwbSiIkmWrPPPwzZv7cS+qbmofH2SZcExPlEdo00fAoJBde5xI/
 v0yakYiFogmlv//aMHTK3ezTal9WAQrLsLDYhwnuLAtvuq8xr6s3bPoo66MblCk6VMU6K8tXdZWrn
 JNqvF1LA==;
Received: from [2602:306:37b0:7840:9e7b:efff:fe40:2b26]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgtra-0005Mt-8C; Sun, 22 Nov 2020 18:13:26 +0000
Subject: Re: Fwd: Petitboot for PS3
To: Carlos Eduardo de Paula <me@carlosedp.com>
References: <CADnnUqfcrYD--zExJ6RB_KFBhr=1TXC8bAnE7AqBQJ7ND9F0Vw@mail.gmail.com>
 <8106659a-16dd-8eb0-08f6-84d5df8ddadb@infradead.org>
 <CADnnUqfCOxyGL-4SUc7OOVh=+3Mah6-gCS4C=9DumJsM5jFbLg@mail.gmail.com>
 <930e55eb-7636-d609-e93a-9319c6b3af94@infradead.org>
 <CADnnUqcJ1DpFW7VNphxMM7Pjo73KguRS0CZfhFSJpg2C9g48tg@mail.gmail.com>
 <CADnnUqcAGigWgKQtu6=tud=V0-7f2aYqNP3MjP=-bRonD1R7_w@mail.gmail.com>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <782f576b-0e38-b151-1d47-5785d876347f@infradead.org>
Date: Sun, 22 Nov 2020 10:13:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADnnUqcAGigWgKQtu6=tud=V0-7f2aYqNP3MjP=-bRonD1R7_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 petitboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Carlos,

On 11/19/20 1:07 PM, Carlos Eduardo de Paula wrote:
> I was able in the petitboot shell to set the timeout for booting an image by using ps3-bl-options (that uses ps3-flash-util itself) but if I use these utilities in my booted linux, I get "magic_num failed" error and can't do any flash operations. I tried loading the ps3flash module and /dev/ps3flash device appears but still can't set it. Also in linux, the devices ps3vflash and etc doesn't show up. Any tips on accessing the flash from booted linux?

Your kernel needs to be built with CONFIG_PS3_FLASH set, as it is
with ps3_defconfig.  I guess this is not your problem though since
it seems you can open and read the ps3flash device, but get an
error in the data returned.

You could add the line '#define DEBUG' to the very top of
'drivers/char/ps3flash.c' to print some driver debug output to
the console.

That "magic_num failed" message is coming from the routine
os_area_header_verify() here:
 
 https://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-utils.git/tree/lib/flash.c#n321

Which I guess in your case is called by os_area_header_read().

My recommendation is to compare the os_area header from petitboot
and from the booted kernel to see how it compares.  You could use
the os_area_db_dump_header() routine from ps3-utils (show-settings).
Another thing is to add some code to the built kernel to dump the
os_area header for comparison to the petitboot data.

> Another question, I generated a kernel patch from your tree diff'ing stock 5.8.0 from your 5.8.0, then I fetched mainline 5.9.8 and applied this patch, built it and added to yaboot.
> 
> The kernel boots fine but I don't get network although the interface is there and after some minutes, I get a kernel oops in the gelic driver. Here's a print from the error.
> 20201119_151317.jpg

Not sure about that error, but if I were to guess, you are running out of memory...

-Geoff
