Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A168D1E7E15
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 15:11:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YQ213XT3zDqjg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 23:11:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.233;
 helo=out03.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=xmission.com
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YPwt2t7PzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 23:07:09 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out03.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>)
 id 1jeeiv-00076E-WD; Fri, 29 May 2020 07:06:58 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1jeeiu-000531-Ok; Fri, 29 May 2020 07:06:57 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-13-mcgrof@kernel.org>
Date: Fri, 29 May 2020 08:03:02 -0500
In-Reply-To: <20200529074108.16928-13-mcgrof@kernel.org> (Luis Chamberlain's
 message of "Fri, 29 May 2020 07:41:07 +0000")
Message-ID: <878shasxkp.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1jeeiu-000531-Ok; ; ; mid=<878shasxkp.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/iLtuGsGMkvU0ljnm4/gjNHORnB+bZL0A=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMNoVowels,XMSubLong
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 0; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: ; sa06 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Luis Chamberlain <mcgrof@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 734 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (1.5%), b_tie_ro: 10 (1.3%), parse: 1.12
 (0.2%), extract_message_metadata: 4.0 (0.5%), get_uri_detail_list:
 1.99 (0.3%), tests_pri_-1000: 4.2 (0.6%), tests_pri_-950: 1.38 (0.2%),
 tests_pri_-900: 1.07 (0.1%), tests_pri_-90: 240 (32.7%), check_bayes:
 238 (32.4%), b_tokenize: 17 (2.3%), b_tok_get_all: 11 (1.4%),
 b_comp_prob: 4.5 (0.6%), b_tok_touch_all: 202 (27.5%), b_finish: 0.93
 (0.1%), tests_pri_0: 454 (61.8%), check_dkim_signature: 0.79 (0.1%),
 check_dkim_adsp: 2.6 (0.4%), poll_dns_idle: 0.60 (0.1%), tests_pri_10:
 2.2 (0.3%), tests_pri_500: 7 (1.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 12/13] sysctl: add helper to register empty subdir
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, joonas.lahtinen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, julia.lawall@lip6.fr, viro@zeniv.linux.org.uk,
 rodrigo.vivi@intel.com, nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luis Chamberlain <mcgrof@kernel.org> writes:

> The way to create a subdirectory from the base set of directories
> is a bit obscure, so provide a helper which makes this clear, and
> also helps remove boiler plate code required to do this work.

I agreee calling:
register_sysctl("fs/binfmt_misc", sysctl_mount_point)
is a bit obscure but if you are going to make a wrapper
please make it the trivial one liner above.

Say something that looks like:
	struct sysctl_header *register_sysctl_mount_point(const char *path)
        {
        	return register_sysctl(path, sysctl_mount_point);
        }

And yes please talk about a mount point and not an empty dir, as these
are permanently empty directories to serve as mount points.  There are
some subtle but important permission checks this allows in the case of
unprivileged mounts.

Further code like this belong in proc_sysctl.c next to all of the code
it is related to so that it is easier to see how to refactor the code if
necessary.

Eric

>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  include/linux/sysctl.h |  7 +++++++
>  kernel/sysctl.c        | 16 +++++++++++++---
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
> index 33a471b56345..89c92390e6de 100644
> --- a/include/linux/sysctl.h
> +++ b/include/linux/sysctl.h
> @@ -208,6 +208,8 @@ extern void register_sysctl_init(const char *path, struct ctl_table *table,
>  extern struct ctl_table_header *register_sysctl_subdir(const char *base,
>  						       const char *subdir,
>  						       struct ctl_table *table);
> +extern void register_sysctl_empty_subdir(const char *base, const char *subdir);
> +
>  void do_sysctl_args(void);
>  
>  extern int pwrsw_enabled;
> @@ -231,6 +233,11 @@ inline struct ctl_table_header *register_sysctl_subdir(const char *base,
>  	return NULL;
>  }
>  
> +static inline void register_sysctl_empty_subdir(const char *base,
> +						const char *subdir)
> +{
> +}
> +
>  static inline struct ctl_table_header *register_sysctl_paths(
>  			const struct ctl_path *path, struct ctl_table *table)
>  {
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index f9a35325d5d5..460532cd5ac8 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -3188,13 +3188,17 @@ struct ctl_table_header *register_sysctl_subdir(const char *base,
>  		{ }
>  	};
>  
> -	if (!table->procname)
> +	if (table != sysctl_mount_point && !table->procname)
>  		goto out;
>  
>  	hdr = register_sysctl_table(base_table);
>  	if (unlikely(!hdr)) {
> -		pr_err("failed when creating subdirectory sysctl %s/%s/%s\n",
> -		       base, subdir, table->procname);
> +		if (table != sysctl_mount_point)
> +			pr_err("failed when creating subdirectory sysctl %s/%s/%s\n",
> +			       base, subdir, table->procname);
> +		else
> +			pr_err("failed when creating empty subddirectory %s/%s\n",
> +			       base, subdir);
>  		goto out;
>  	}
>  	kmemleak_not_leak(hdr);
> @@ -3202,6 +3206,12 @@ struct ctl_table_header *register_sysctl_subdir(const char *base,
>  	return hdr;
>  }
>  EXPORT_SYMBOL_GPL(register_sysctl_subdir);
> +
> +void register_sysctl_empty_subdir(const char *base,
> +				  const char *subdir)
> +{
> +	register_sysctl_subdir(base, subdir, sysctl_mount_point);
> +}
>  #endif /* CONFIG_SYSCTL */
>  /*
>   * No sense putting this after each symbol definition, twice,
