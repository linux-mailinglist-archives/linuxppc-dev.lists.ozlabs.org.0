Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD2143C90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 13:09:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4826lY0RPrzDqVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 23:09:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4826jQ46GgzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 23:07:19 +1100 (AEDT)
Received: by mail-wr1-f66.google.com with SMTP id g17so2931072wro.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 04:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8+eTFTZWY1O+bS0tfQzZZHJ2QVfVqRuc9/acRYq78eE=;
 b=oeSLq7nmGn5KDRraRLqFq2RsaYXF8gTLp+vcma7l2DNMqpyWunBTQSFUJEzaBz7Zg+
 zpbtFO7H6jwc2J+/DHUaefHGlKIjALv31JRjpcaaaDdf7Hxp4haBU8Gw+IxhoXuM1tRk
 6TojEs7ZftrW7DIPLH863nAP1UEb4YNzXO62I6/MdmRwsWyP6LL/y6b2WePP3td3v+Zb
 ZjsLEl6eOVAgmJNYMTOujxGK8cM2U+BTVIyPwNcZZa1yt9Lo7J27aj/e/ZE87IN0emK5
 73unPns677hCaYHSNQ6VGLi55NvnswyrdnIhT2pIEosPD9+POOKo5JA1C9dDmJBkhPE9
 OVIQ==
X-Gm-Message-State: APjAAAVArSX0DaSDtIrmo6hUtee9AJZ+k6y1WqJvmX6gechixiKaSHAl
 K7eGUIy2P0475Zzipb1Qfy0=
X-Google-Smtp-Source: APXvYqyxpUkI3wcRNy1BJM6GIVX1qC65Wu9WoeWHqPOsSl8LeuToreKpatoaJ2IPUby2HJ4XnSMCzg==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr4797172wrq.331.1579608436190; 
 Tue, 21 Jan 2020 04:07:16 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z83sm3932163wmg.2.2020.01.21.04.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 04:07:14 -0800 (PST)
Date: Tue, 21 Jan 2020 13:07:14 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Message-ID: <20200121120714.GJ29276@dhcp22.suse.cz>
References: <20200117113353.GT19428@dhcp22.suse.cz>
 <c82a0dd7-a99b-6def-83d4-a19fbdd405d9@redhat.com>
 <20200117145233.GB19428@dhcp22.suse.cz>
 <65606e2e-1cf7-de3b-10b1-33653cb41a52@redhat.com>
 <20200117152947.GK19428@dhcp22.suse.cz>
 <CAPcyv4hHHzdPp4SQ0sePzx7XEvD7U_B+vZDT00O6VbFY8kJqjw@mail.gmail.com>
 <25a94f61-46a1-59a6-6b54-8cc6b35790d2@redhat.com>
 <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
 <20200120074816.GG18451@dhcp22.suse.cz>
 <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 20-01-20 10:14:44, David Hildenbrand wrote:
> On 20.01.20 08:48, Michal Hocko wrote:
> > On Fri 17-01-20 08:57:51, Dan Williams wrote:
> > [...]
> >> Unless the user is willing to hold the device_hotplug_lock over the
> >> evaluation then the result is unreliable.
> > 
> > Do we want to hold the device_hotplug_lock from this user readable file
> > in the first place? My book says that this just waits to become a
> > problem.
> 
> It was the "big hammer" solution for this RFC.
> 
> I think we could do with a try_lock() on the device_lock() paired with a
> device->removed flag. The latter is helpful for properly catching zombie
> devices on the onlining/offlining path either way (and on my todo list).

try_lock would be more considerate. It would at least make any potential
hammering a bit harder.

> > Really, the interface is flawed and should have never been merged in the
> > first place. We cannot simply remove it altogether I am afraid so let's
> > at least remove the bogus code and pretend that the world is a better
> > place where everything is removable except the reality sucks...
> 
> As I expressed already, the interface works as designed/documented and
> has been used like that for years.

It seems we do differ in the usefulness though. Using a crappy interface
for years doesn't make it less crappy. I do realize we cannot remove the
interface but we can remove issues with the implementation and I dare to
say that most existing users wouldn't really notice.

> I tend to agree that it never should have been merged like that.
> 
> We have (at least) two places that are racy (with concurrent memory
> hotplug):
> 
> 1. /sys/.../memoryX/removable
> - a) make it always return yes and make the interface useless
> - b) add proper locking and keep it running as is (e.g., so David can
>      identify offlineable memory blocks :) ).
> 
> 2. /sys/.../memoryX/valid_zones
> - a) always return "none" if the memory is online
> - b) add proper locking and keep it running as is
> - c) cache the result ("zone") when a block is onlined (e.g., in
> mem->zone. If it is NULL, either mixed zones or unknown)
> 
> At least 2. already scream for a proper device_lock() locking as the
> mem->state is not stable across the function call.
> 
> 1a and 2a are the easiest solutions but remove all ways to identify if a
> memory block could theoretically be offlined - without trying
> (especially, also to identify the MOVABLE zone).
> 
> I tend to prefer 1b) and 2c), paired with proper device_lock() locking.
> We don't affect existing use cases but are able to simplify the code +
> fix the races.
> 
> What's your opinion? Any alternatives?

1a) and 2c) if you ask me.
-- 
Michal Hocko
SUSE Labs
