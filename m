Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A88A0827
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:09:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JXJy5hF9zDrGw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 03:09:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JXH30FgGzDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 03:07:25 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D55AB662;
 Wed, 28 Aug 2019 17:07:22 +0000 (UTC)
Date: Wed, 28 Aug 2019 19:07:21 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH rebased] powerpc/fadump: when fadump is supported
 register the fadump sysfs files.
Message-ID: <20190828190721.555b6337@naga>
In-Reply-To: <e7fad352-48f3-f01d-1b19-a589a3b95c07@linux.ibm.com>
References: <20190820181211.14694-1-msuchanek@suse.de>
 <e7fad352-48f3-f01d-1b19-a589a3b95c07@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Yangtao Li <tiny.windzz@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Hari Bathini <hbathini@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Aug 2019 17:57:31 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> Hi Michal,
> 
> Thanks for the patch. 
> 
> On 20/08/19 11:42 PM, Michal Suchanek wrote:
> > Currently it is not possible to distinguish the case when fadump is
> > supported by firmware and disabled in kernel and completely unsupported
> > using the kernel sysfs interface. User can investigate the devicetree
> > but it is more reasonable to provide sysfs files in case we get some
> > fadumpv2 in the future.
> > 
> > With this patch sysfs files are available whenever fadump is supported
> > by firmware.
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > Rebase on top of http://patchwork.ozlabs.org/patch/1150160/
> > [v5,31/31] powernv/fadump: support holes in kernel boot memory area
> > ---
> >  arch/powerpc/kernel/fadump.c | 33 ++++++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 15 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> > index 4b1bb3c55cf9..7ad424729e9c 100644
> > --- a/arch/powerpc/kernel/fadump.c
> > +++ b/arch/powerpc/kernel/fadump.c
> > @@ -1319,13 +1319,9 @@ static void fadump_init_files(void)
> >   */
> >  int __init setup_fadump(void)
> >  {
> > -	if (!fw_dump.fadump_enabled)
> > -		return 0;
> > -
> > -	if (!fw_dump.fadump_supported) {
> > +	if (!fw_dump.fadump_supported && fw_dump.fadump_enabled) {
> >  		printk(KERN_ERR "Firmware-assisted dump is not supported on"
> >  			" this hardware\n");
> > -		return 0;
> >  	}
> >  
> >  	fadump_show_config();
> > @@ -1333,19 +1329,26 @@ int __init setup_fadump(void)
> >  	 * If dump data is available then see if it is valid and prepare for
> >  	 * saving it to the disk.
> >  	 */
> > -	if (fw_dump.dump_active) {
> > +	if (fw_dump.fadump_enabled) {
> > +		if (fw_dump.dump_active) {
> > +			/*
> > +			 * if dump process fails then invalidate the
> > +			 * registration and release memory before proceeding
> > +			 * for re-registration.
> > +			 */
> > +			if (fw_dump.ops->fadump_process(&fw_dump) < 0)
> > +				fadump_invalidate_release_mem();
> > +		}
> >  		/*
> > -		 * if dump process fails then invalidate the registration
> > -		 * and release memory before proceeding for re-registration.
> > +		 * Initialize the kernel dump memory structure for FAD
> > +		 * registration.
> >  		 */
> > -		if (fw_dump.ops->fadump_process(&fw_dump) < 0)
> > -			fadump_invalidate_release_mem();
> > -	}
> > -	/* Initialize the kernel dump memory structure for FAD registration. */
> > -	else if (fw_dump.reserve_dump_area_size)
> > -		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
> > +		else if (fw_dump.reserve_dump_area_size)
> > +			fw_dump.ops->fadump_init_mem_struct(&fw_dump);
> >  
> > -	fadump_init_files();
> > +	}
> > +	if (fw_dump.fadump_supported)
> > +		fadump_init_files();
> >  
> >  	return 1;
> >  }
> >   
> 
> 
> Could you please move up fadump_init_files() call and return after it instead of
> nesting rest of the function. 

That sounds reasonable.

> Also, get rid of the error message when fadump is
> not supported as it is already taken care of in fadump_reserve_mem() function.

That should not be called in that case, should it?

Anyway, I find the message right next to the message about reserving
memory for kdump. So it really looks helpful in the log.

> I mean:
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 2015b1f..0e9b028 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1322,16 +1322,16 @@ static void fadump_init_files(void)
>   */
>  int __init setup_fadump(void)
>  {
> -       if (!fw_dump.fadump_enabled)
> +       if (!fw_dump.fadump_supported)
>                 return 0;
>  
> -       if (!fw_dump.fadump_supported) {
> -               printk(KERN_ERR "Firmware-assisted dump is not supported on"
> -                       " this hardware\n");
> -               return 0;
> -       }
> +       fadump_init_files();
>  
>         fadump_show_config();
> +
> +       if (!fw_dump.fadump_enabled)
> +               return 0;

Should the init function return 0 when it did something that needs to
be undone later (ie registering the sysfs files)? This is probably not
very meaningful for fadump but what is the correct way to not set a bad
example?

Thanks

Michal
