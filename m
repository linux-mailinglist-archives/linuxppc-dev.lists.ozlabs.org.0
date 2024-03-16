Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A287D8BE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 05:26:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=M1dDPutJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxSk73g3Lz3dhR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 15:26:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=M1dDPutJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fromorbit.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=david@fromorbit.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxQf24lqJz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 13:52:57 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc5d0162bcso20769905ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 19:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1710557573; x=1711162373; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bBoX08MQ+GnGsn3Ys1XDLWs0vSpU6QZ104y6JQ1iJRA=;
        b=M1dDPutJdZ3grW5sxjtdR8wvRDPBtFjyiVj43Nxgi+6JNFWG/f0PHRK0TMjSGDN3V6
         jVIZxaRPETV+XXK1CyeVms2BSUcThyoq+rB/nocVhHvlOkJObnxeaqyCosdlEbDy7GXy
         63F80W8HqPn9Tkm6WhK92P1fnDIdhckbr++PJ+gJ4/J1xKhh54xPwh/8JQ11OSPPIZa+
         PynSKJAV5W5QWzDaFvvkdQqe3RFk4npD7rg3F7/umkcTfKPjD0vST4Xfzohx5QdI22+N
         ZkkETuhXGII1opEIfiq8oWKV39/3O6Rfumm5+Tdl5qefQ7qZpOfeg8RGTQAk64DabnLb
         HA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710557573; x=1711162373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBoX08MQ+GnGsn3Ys1XDLWs0vSpU6QZ104y6JQ1iJRA=;
        b=QMgkjQBdy8+GSOY13JKuqU+ow7CwvjTlvIbhVKZNny0RlFou/435FTTntbC+ulbFpx
         Tv+3ySbwxnyTF5aFwQPUl/XDnrYb3QHja47Pl4VzsGdginQCao9iXBY8P262Tplcnl4+
         hQCq3x7kAMBCr6ukpoLCrN+Wme4tDKBkqNV/Ob0U/J7JQyTOyeUzmSld0dSgAb56op/a
         4yiuAqGv+jOXz4YKzQ81bQ+BUpkvJ2UchQUV+kkGdWL6XebU5OeDQvPqRraksFSeSw/C
         Que/zdseUXOO29N66glTpgWWqIr7J6MZn9PBbIoYC6xR83FHdZhIh+gMy4JiAaFHdQze
         Xapg==
X-Forwarded-Encrypted: i=1; AJvYcCUoMo5Qq/bhvpXFBz7cYnJ+1K65cdE/ltMaJAKbTZapJUia9ztV+BgUaOrHzRemTjRR4+XWtlrRfbq84h5Mc0y4IOqOs3Ldmq+RimgzZA==
X-Gm-Message-State: AOJu0YwD7Qi9vRqg6Mxb+V8aAGnxVUXRrZmGY6WcooThhGcd7XnItvAt
	wNO+JKRiYp4M4P3nfmAQwtc1Avr2kuGVwXMyGD4nC1GsaiNuQ9WqO5PQmR8Djsc=
X-Google-Smtp-Source: AGHT+IF+mhHYlAObRzpfXYn3IGnPDczeVjZaH7QVUqvtIq9UdyOULCBCqzY79zAwu/GemLxZ182Fng==
X-Received: by 2002:a17:903:2446:b0:1dd:9cb3:8f96 with SMTP id l6-20020a170903244600b001dd9cb38f96mr6055795pls.42.1710557572964;
        Fri, 15 Mar 2024 19:52:52 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-185-123.pa.nsw.optusnet.com.au. [49.180.185.123])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902684500b001dddbb58d5esm4736209pln.109.2024.03.15.19.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 19:52:52 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rlKAC-002Wnj-2F;
	Sat, 16 Mar 2024 13:52:48 +1100
Date: Sat, 16 Mar 2024 13:52:48 +1100
From: Dave Chinner <david@fromorbit.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 11/11] sysctl: treewide: constify the ctl_table argument
 of handlers
Message-ID: <ZfUJgML8tk6RWqOC@dread.disaster.area>
References: <20240315-sysctl-const-handler-v1-0-1322ac7cb03d@weissschuh.net>
 <20240315-sysctl-const-handler-v1-11-1322ac7cb03d@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315-sysctl-const-handler-v1-11-1322ac7cb03d@weissschuh.net>
X-Mailman-Approved-At: Sat, 16 Mar 2024 15:26:03 +1100
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
Cc: Joel Granados <j.granados@samsung.com>, Juri Lelli <juri.lelli@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>, linux-sctp@vger.kernel.org, Yonghong Song <yonghong.song@linux.dev>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, James Morris <jmorris@namei.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Mel Gorman <mgorman@suse.de>, "Darrick J. Wong" <djwong@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexander Popov <alex.popov@linux.com>, Petr Mladek <pmladek@suse.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Remi Denis-Courmont <courmisch@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Christian Brauner <brauner@kernel.org>, Will Drewry <wad@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Sergey Senozhatsky 
 <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, netfilter-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Dave Hansen <dave.hansen@linux.intel.com>, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, John Stultz <jstultz@google.com>, Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>, Anup Patel <anup@brainfault.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Julian Anastasov <ja@ssi.bg>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Sven Schnelle <svens@lin
 ux.ibm.com>, John Ogness <john.ogness@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Simon Horman <horms@verge.net.au>, Xin Long <lucien.xin@gmail.com>, linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>, Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>, Muchun Song <muchun.song@linux.dev>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nikolay Aleksandrov <razor@blackwall.org>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, linux-hardening@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, lvs-devel@vger.kernel.org, Neil Brown <neilb@suse.de>, Allison Hender
 son <allison.henderson@oracle.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>, bridge@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, linux-nfs@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Jeff Layton <jlayton@kernel.org>, Andy Lutomirski <luto@amacapital.net>, linux-xfs@vger.kernel.org, bpf@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Chandan Babu R <chandan.babu@oracle.com>, Ian Rogers <irogers@google.com>, Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>, KP Singh <kpsingh@kernel.org>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, rds-devel@oss.oracle.com, x86@kernel.org, Dai Ngo <Dai.Ngo@oracle.com>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>
 , Trond Myklebust <trond.myklebust@hammerspace.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>, Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>, Paul Moore <paul@paul-moore.com>, John Johansen <john.johansen@canonical.com>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, kexec@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Eduard Zingerman <eddyz87@gmail.com>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 15, 2024 at 09:48:09PM +0100, Thomas Weißschuh wrote:
> Adapt the proc_hander function signature to make it clear that handlers
> are not supposed to modify their ctl_table argument.
> 
> This is a prerequisite to moving the static ctl_table structs into
> .rodata.
> By migrating all handlers at once a lengthy transition can be avoided.
> 
> The patch was mostly generated by coccinelle with the following script:
> 
>     @@
>     identifier func, ctl, write, buffer, lenp, ppos;
>     @@
> 
>     int func(
>     - struct ctl_table *ctl,
>     + const struct ctl_table *ctl,
>       int write, void *buffer, size_t *lenp, loff_t *ppos)
>     { ... }

Which seems to have screwed up the formatting of the XFS code...

> diff --git a/fs/xfs/xfs_sysctl.c b/fs/xfs/xfs_sysctl.c
> index a191f6560f98..a3ca192eca79 100644
> --- a/fs/xfs/xfs_sysctl.c
> +++ b/fs/xfs/xfs_sysctl.c
> @@ -10,12 +10,11 @@ static struct ctl_table_header *xfs_table_header;
>  
>  #ifdef CONFIG_PROC_FS
>  STATIC int
> -xfs_stats_clear_proc_handler(
> -	struct ctl_table	*ctl,
> -	int			write,
> -	void			*buffer,
> -	size_t			*lenp,
> -	loff_t			*ppos)
> +xfs_stats_clear_proc_handler(const struct ctl_table *ctl,
> +			     int			write,
> +			     void			*buffer,
> +			     size_t			*lenp,
> +			     loff_t			*ppos)

... because this doesn't match any format I've ever seen in the
kernel. The diff for this change shold be just:

@@ -10,7 +10,7 @@ static struct ctl_table_header *xfs_table_header;
 #ifdef CONFIG_PROC_FS
 STATIC int
 xfs_stats_clear_proc_handler(
-	struct ctl_table	*ctl,
+	const struct ctl_table	*ctl,
 	int			write,
 	void			*buffer,
 	size_t			*lenp,

>  {
>  	int		ret, *valp = ctl->data;
>  
> @@ -30,12 +29,11 @@ xfs_stats_clear_proc_handler(
>  }
>  
>  STATIC int
> -xfs_panic_mask_proc_handler(
> -	struct ctl_table	*ctl,
> -	int			write,
> -	void			*buffer,
> -	size_t			*lenp,
> -	loff_t			*ppos)
> +xfs_panic_mask_proc_handler(const struct ctl_table *ctl,
> +			    int			write,
> +			    void			*buffer,
> +			    size_t			*lenp,
> +			    loff_t			*ppos)
>  {
>  	int		ret, *valp = ctl->data;
>  
> @@ -51,12 +49,11 @@ xfs_panic_mask_proc_handler(
>  #endif /* CONFIG_PROC_FS */
>  
>  STATIC int
> -xfs_deprecated_dointvec_minmax(
> -	struct ctl_table	*ctl,
> -	int			write,
> -	void			*buffer,
> -	size_t			*lenp,
> -	loff_t			*ppos)
> +xfs_deprecated_dointvec_minmax(const struct ctl_table *ctl,
> +			       int			write,
> +			       void			*buffer,
> +			       size_t			*lenp,
> +			       loff_t			*ppos)
>  {
>  	if (write) {
>  		printk_ratelimited(KERN_WARNING

And these need fixing as well.

A further quick glance at the patch reveals that there are other
similar screwed up conversions as well.

> diff --git a/kernel/delayacct.c b/kernel/delayacct.c
> index 6f0c358e73d8..513791ef573d 100644
> --- a/kernel/delayacct.c
> +++ b/kernel/delayacct.c
> @@ -44,8 +44,9 @@ void delayacct_init(void)
>  }
>  
>  #ifdef CONFIG_PROC_SYSCTL
> -static int sysctl_delayacct(struct ctl_table *table, int write, void *buffer,
> -		     size_t *lenp, loff_t *ppos)
> +static int sysctl_delayacct(const struct ctl_table *table, int write,
> +			    void *buffer,
> +			    size_t *lenp, loff_t *ppos)
>  {
>  	int state = delayacct_on;
>  	struct ctl_table t;

Like this.

> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 724e6d7e128f..e2955e0d9f44 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -450,7 +450,8 @@ static void update_perf_cpu_limits(void)
>  
>  static bool perf_rotate_context(struct perf_cpu_pmu_context *cpc);
>  
> -int perf_event_max_sample_rate_handler(struct ctl_table *table, int write,
> +int perf_event_max_sample_rate_handler(const struct ctl_table *table,
> +				       int write,
>  				       void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	int ret;

And this.

> @@ -474,8 +475,10 @@ int perf_event_max_sample_rate_handler(struct ctl_table *table, int write,
>  
>  int sysctl_perf_cpu_time_max_percent __read_mostly = DEFAULT_CPU_TIME_MAX_PERCENT;
>  
> -int perf_cpu_time_max_percent_handler(struct ctl_table *table, int write,
> -		void *buffer, size_t *lenp, loff_t *ppos)
> +int perf_cpu_time_max_percent_handler(const struct ctl_table *table,
> +				      int write,
> +				      void *buffer, size_t *lenp,
> +				      loff_t *ppos)
>  {
>  	int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>  

And this.

> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
> index b2fc2727d654..003f0f5cb111 100644
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -239,9 +239,10 @@ static long hung_timeout_jiffies(unsigned long last_checked,
>  /*
>   * Process updating of timeout sysctl
>   */
> -static int proc_dohung_task_timeout_secs(struct ctl_table *table, int write,
> -				  void *buffer,
> -				  size_t *lenp, loff_t *ppos)
> +static int proc_dohung_task_timeout_secs(const struct ctl_table *table,
> +					 int write,
> +					 void *buffer,
> +					 size_t *lenp, loff_t *ppos)
>  {
>  	int ret;
>  

And this.

> diff --git a/kernel/latencytop.c b/kernel/latencytop.c
> index 781249098cb6..0a5c22b19821 100644
> --- a/kernel/latencytop.c
> +++ b/kernel/latencytop.c
> @@ -65,8 +65,9 @@ static struct latency_record latency_record[MAXLR];
>  int latencytop_enabled;
>  
>  #ifdef CONFIG_SYSCTL
> -static int sysctl_latencytop(struct ctl_table *table, int write, void *buffer,
> -		size_t *lenp, loff_t *ppos)
> +static int sysctl_latencytop(const struct ctl_table *table, int write,
> +			     void *buffer,
> +			     size_t *lenp, loff_t *ppos)
>  {
>  	int err;
>  

And this.

I could go on, but there are so many examples of this in the patch
that I think that it needs to be toosed away and regenerated in a
way that doesn't trash the existing function parameter formatting.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
