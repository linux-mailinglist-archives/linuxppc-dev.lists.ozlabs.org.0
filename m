Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0DD84FAC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:13:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWgS028J9z3cV9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 04:13:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Sat, 10 Feb 2024 04:13:28 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWgRX0qXWz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 04:13:27 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5258950"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="5258950"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 09:11:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="910768835"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="910768835"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 09:11:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rYUOz-00000003Cxy-3Zci;
	Fri, 09 Feb 2024 19:11:01 +0200
Date: Fri, 9 Feb 2024 19:11:01 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v4 00/10] devm_led_classdev_register() usage problem
Message-ID: <ZcZcpUHygltD2ETa@smile.fi.intel.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231221151111.GJ10102@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221151111.GJ10102@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: kernel@salutedevices.com, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, hdegoede@redhat.com, mingo@redhat.com, npiggin@gmail.com, pavel@ucw.cz, George Stark <gnstark@salutedevices.com>, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 21, 2023 at 03:11:11PM +0000, Lee Jones wrote:
> On Thu, 14 Dec 2023, George Stark wrote:
> 
> > This patch series fixes the problem of devm_led_classdev_register misusing.
> > 
> > The basic problem is described in [1]. Shortly when devm_led_classdev_register()
> > is used then led_classdev_unregister() called after driver's remove() callback.
> > led_classdev_unregister() calls driver's brightness_set callback and that callback
> > may use resources which were destroyed already in driver's remove().
> > 
> > After discussion with maintainers [2] [3] we decided:
> > 1) don't touch led subsytem core code and don't remove led_set_brightness() from it
> > but fix drivers
> > 2) don't use devm_led_classdev_unregister
> > 
> > So the solution is to use devm wrappers for all resources
> > driver's brightness_set() depends on. And introduce dedicated devm wrapper
> > for mutex as it's often used resource.
> > 
> > [1] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/
> > [2] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mc132b9b350fa51931b4fcfe14705d9f06e91421f
> > [3] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mdbf572a85c33f869a553caf986b6228bb65c8383

...

> FYI: I'll conduct my review once the locking side is settled.

To reduce burden can you apply the first one? It's a fix.

-- 
With Best Regards,
Andy Shevchenko


