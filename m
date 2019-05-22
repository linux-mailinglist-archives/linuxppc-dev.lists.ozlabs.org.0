Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB71268C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 18:59:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458JlK5VXdzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 02:59:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458Jjq4P57zDqKy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 02:58:21 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 494B93053878;
 Wed, 22 May 2019 16:57:52 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.159])
 by smtp.corp.redhat.com (Postfix) with SMTP id 69B5560BE5;
 Wed, 22 May 2019 16:57:40 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Wed, 22 May 2019 18:57:50 +0200 (CEST)
Date: Wed, 22 May 2019 18:57:37 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH v1 1/2] open: add close_range()
Message-ID: <20190522165737.GC4915@redhat.com>
References: <20190522155259.11174-1-christian@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190522155259.11174-1-christian@brauner.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 22 May 2019 16:58:18 +0000 (UTC)
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, ldv@altlinux.org,
 dhowells@redhat.com, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, shuah@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, miklos@szeredi.hu, x86@kernel.org,
 torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, fweimer@redhat.com,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/22, Christian Brauner wrote:
>
> +static struct file *pick_file(struct files_struct *files, unsigned fd)
>  {
> -	struct file *file;
> +	struct file *file = NULL;
>  	struct fdtable *fdt;
>  
>  	spin_lock(&files->file_lock);
> @@ -632,15 +629,65 @@ int __close_fd(struct files_struct *files, unsigned fd)
>  		goto out_unlock;
>  	rcu_assign_pointer(fdt->fd[fd], NULL);
>  	__put_unused_fd(files, fd);
> -	spin_unlock(&files->file_lock);
> -	return filp_close(file, files);
>  
>  out_unlock:
>  	spin_unlock(&files->file_lock);
> -	return -EBADF;
> +	return file;

...

> +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> +{
> +	unsigned int cur_max;
> +
> +	if (fd > max_fd)
> +		return -EINVAL;
> +
> +	rcu_read_lock();
> +	cur_max = files_fdtable(files)->max_fds;
> +	rcu_read_unlock();
> +
> +	/* cap to last valid index into fdtable */
> +	if (max_fd >= cur_max)
> +		max_fd = cur_max - 1;
> +
> +	while (fd <= max_fd) {
> +		struct file *file;
> +
> +		file = pick_file(files, fd++);

Well, how about something like

	static unsigned int find_next_opened_fd(struct fdtable *fdt, unsigned start)
	{
		unsigned int maxfd = fdt->max_fds;
		unsigned int maxbit = maxfd / BITS_PER_LONG;
		unsigned int bitbit = start / BITS_PER_LONG;

		bitbit = find_next_bit(fdt->full_fds_bits, maxbit, bitbit) * BITS_PER_LONG;
		if (bitbit > maxfd)
			return maxfd;
		if (bitbit > start)
			start = bitbit;
		return find_next_bit(fdt->open_fds, maxfd, start);
	}

	unsigned close_next_fd(struct files_struct *files, unsigned start, unsigned maxfd)
	{
		unsigned fd;
		struct file *file;
		struct fdtable *fdt;
	
		spin_lock(&files->file_lock);
		fdt = files_fdtable(files);
		fd = find_next_opened_fd(fdt, start);
		if (fd >= fdt->max_fds || fd > maxfd) {
			fd = -1;
			goto out;
		}

		file = fdt->fd[fd];
		rcu_assign_pointer(fdt->fd[fd], NULL);
		__put_unused_fd(files, fd);
	out:
		spin_unlock(&files->file_lock);

		if (fd == -1u)
			return fd;

		filp_close(file, files);
		return fd + 1;
	}

?

Then close_range() can do

	while (fd < max_fd)
		fd = close_next_fd(fd, maxfd);

Oleg.

