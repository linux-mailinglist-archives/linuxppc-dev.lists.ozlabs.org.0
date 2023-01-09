Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD9662482
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 12:45:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrBvq4jmHz3cgt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:45:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=inai.de (client-ip=2a01:4f8:10b:45d8::f5; helo=a3.inai.de; envelope-from=jengelh@inai.de; receiver=<UNKNOWN>)
X-Greylist: delayed 444 seconds by postgrey-1.36 at boromir; Mon, 09 Jan 2023 19:22:12 AEDT
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr6PJ3z36z2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 19:22:12 +1100 (AEDT)
Received: by a3.inai.de (Postfix, from userid 25121)
	id 1BED758957AAE; Mon,  9 Jan 2023 09:14:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 5306160BC6B00;
	Mon,  9 Jan 2023 09:14:34 +0100 (CET)
Date: Mon, 9 Jan 2023 09:14:34 +0100 (CET)
From: Jan Engelhardt <jengelh@inai.de>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH net-next] Remove DECnet support from kernel
In-Reply-To: <07786498-2209-3af0-8d68-c34427049947@kernel.org>
Message-ID: <po9s7-9snp-9so3-n6r5-qs217ss1633o@vanv.qr>
References: <20220818004357.375695-1-stephen@networkplumber.org> <07786498-2209-3af0-8d68-c34427049947@kernel.org>
User-Agent: Alpine 2.25 (LSU 592 2021-09-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Mon, 09 Jan 2023 22:45:00 +1100
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
Cc: "open list:NETFILTER" <netfilter-devel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Nathan Fontenot <nathan.fontenot@amd.com>, Suma Hegde <suma.hegde@amd.com>, Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Menglong Dong <imagedong@tencent.com>, Florian Fainelli <f.fainelli@gmail.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.com>, "open list:NETFILTER" <coreteam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>
 , Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Petr Machata <petrm@nvidia.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Yu Zhe <yuzhe@nfschina.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat Karakotov <hmukos@yandex-team.ru>, "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>, open list <
 linux-kernel@vger.kernel.org>, Stephen Hemminger <stephen@networkplumber.org>, Chuck Lever <chuck.lever@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Antoine Tenart <atenart@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Monday 2023-01-09 08:04, Jiri Slaby wrote:
> On 18. 08. 22, 2:43, Stephen Hemminger wrote:
>> DECnet is an obsolete network protocol
>
> this breaks userspace. Some projects include linux/dn.h:
>
>  https://codesearch.debian.net/search?q=include.*linux%2Fdn.h&literal=0
>
> I found Trinity fails to build:
> net/proto-decnet.c:5:10: fatal error: linux/dn.h: No such file or directory
>     5 | #include <linux/dn.h>
>
> Should we provide the above as empty files?

Not a good idea. There may be configure tests / code that merely checks for
dn.h existence without checking for specific contents/defines. If you provide
empty files, this would fail to build:

#include "config.h"
#ifdef HAVE_LINUX_DN_H
#	include <linux/dn.h>
#endif
int main() {
#ifdef HAVE_LINUX_DN_H
	socket(AF_DECNET, 0, DNPROTO_NSP); // or whatever
#else
	...
#endif
}

So, with my distro hat on, outright removing header files feels like the
slightly lesser of two evils. Given the task to port $arbitrary software
between operating systems, absent header files is something more or less
"regularly" encountered, so one could argue we are "trained" to deal with it.
But missing individual defines is a much deeper dive into the APIs and
software to patch it out.
