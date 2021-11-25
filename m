Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7FE45D778
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:43:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Cc10VWHz3cBv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:43:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jani.nikula@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0CbZ3WJnz2yPh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:42:48 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="298887079"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="298887079"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 01:41:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="475590916"
Received: from dshe-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.10.64])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 01:41:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>, akpm@linux-foundation.org,
 keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.chairlied, benh@kernel.crashing.org, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, jack@suse.cz,
 amir73il@gmail.com, phil@philpotter.co.uk, viro@zeniv.linux.org.uk,
 julia.lawall@inria.fr
Subject: Re: [PATCH v2 2/8] i915: simplify subdirectory registration with
 register_sysctl()
In-Reply-To: <20211123202422.819032-3-mcgrof@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211123202422.819032-1-mcgrof@kernel.org>
 <20211123202422.819032-3-mcgrof@kernel.org>
Date: Thu, 25 Nov 2021 11:41:30 +0200
Message-ID: <87fsrklghh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Nov 2021, Luis Chamberlain <mcgrof@kernel.org> wrote:
> There is no need to user boiler plate code to specify a set of base
> directories we're going to stuff sysctls under. Simplify this by using
> register_sysctl() and specifying the directory path directly.

\o/

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> // pycocci sysctl-subdir-register-sysctl-simplify.cocci PATH
>
> @c1@
> expression E1;
> identifier subdir, sysctls;
> @@
>
> static struct ctl_table subdir[] = {
> 	{
> 		.procname = E1,
> 		.maxlen = 0,
> 		.mode = 0555,
> 		.child = sysctls,
> 	},
> 	{ }
> };
>
> @c2@
> identifier c1.subdir;
>
> expression E2;
> identifier base;
> @@
>
> static struct ctl_table base[] = {
> 	{
> 		.procname = E2,
> 		.maxlen = 0,
> 		.mode = 0555,
> 		.child = subdir,
> 	},
> 	{ }
> };
>
> @c3@
> identifier c2.base;
> identifier header;
> @@
>
> header = register_sysctl_table(base);
>
> @r1 depends on c1 && c2 && c3@
> expression c1.E1;
> identifier c1.subdir, c1.sysctls;
> @@
>
> -static struct ctl_table subdir[] = {
> -	{
> -		.procname = E1,
> -		.maxlen = 0,
> -		.mode = 0555,
> -		.child = sysctls,
> -	},
> -	{ }
> -};
>
> @r2 depends on c1 && c2 && c3@
> identifier c1.subdir;
>
> expression c2.E2;
> identifier c2.base;
> @@
> -static struct ctl_table base[] = {
> -	{
> -		.procname = E2,
> -		.maxlen = 0,
> -		.mode = 0555,
> -		.child = subdir,
> -	},
> -	{ }
> -};
>
> @initialize:python@
> @@
>
> def make_my_fresh_expression(s1, s2):
>   return '"' + s1.strip('"') + "/" + s2.strip('"') + '"'
>
> @r3 depends on c1 && c2 && c3@
> expression c1.E1;
> identifier c1.sysctls;
> expression c2.E2;
> identifier c2.base;
> identifier c3.header;
> fresh identifier E3 = script:python(E2, E1) { make_my_fresh_expression(E2, E1) };
> @@
>
> header =
> -register_sysctl_table(base);
> +register_sysctl(E3, sysctls);
>
> Generated-by: Coccinelle SmPL
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/gpu/drm/i915/i915_perf.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2f01b8c0284c..5979e3258647 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4273,26 +4273,6 @@ static struct ctl_table oa_table[] = {
>  	{}
>  };
>  
> -static struct ctl_table i915_root[] = {
> -	{
> -	 .procname = "i915",
> -	 .maxlen = 0,
> -	 .mode = 0555,
> -	 .child = oa_table,
> -	 },
> -	{}
> -};
> -
> -static struct ctl_table dev_root[] = {
> -	{
> -	 .procname = "dev",
> -	 .maxlen = 0,
> -	 .mode = 0555,
> -	 .child = i915_root,
> -	 },
> -	{}
> -};
> -
>  static void oa_init_supported_formats(struct i915_perf *perf)
>  {
>  	struct drm_i915_private *i915 = perf->i915;
> @@ -4488,7 +4468,7 @@ static int destroy_config(int id, void *p, void *data)
>  
>  int i915_perf_sysctl_register(void)
>  {
> -	sysctl_header = register_sysctl_table(dev_root);
> +	sysctl_header = register_sysctl("dev/i915", oa_table);
>  	return 0;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
