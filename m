Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DE3943AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 15:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fs5r00smwz3bpL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 23:58:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=qg+n=kx=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fs5qd73zMz2xvB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 23:58:05 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBD3B61184;
 Fri, 28 May 2021 13:58:01 +0000 (UTC)
Date: Fri, 28 May 2021 09:58:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
Message-ID: <20210528095800.06b6547d@gandalf.local.home>
In-Reply-To: <20210517092006.803332-1-omosnace@redhat.com>
References: <20210517092006.803332-1-omosnace@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: selinux@vger.kernel.org, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 Casey Schaufler <casey@schaufler-ca.com>,
 linux-security-module@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 May 2021 11:20:06 +0200
Ondrej Mosnacek <omosnace@redhat.com> wrote:

> diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> index 1261e8b41edb..7edde3fc22f5 100644
> --- a/fs/tracefs/inode.c
> +++ b/fs/tracefs/inode.c
> @@ -396,7 +396,7 @@ struct dentry *tracefs_create_file(const char *name, umode_t mode,
>  	struct dentry *dentry;
>  	struct inode *inode;
>  
> -	if (security_locked_down(LOCKDOWN_TRACEFS))
> +	if (security_cred_locked_down(NULL, LOCKDOWN_TRACEFS))
>  		return NULL;
>  
>  	if (!(mode & S_IFMT))

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
