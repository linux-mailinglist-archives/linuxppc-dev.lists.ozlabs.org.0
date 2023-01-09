Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAF662A23
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 16:36:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrJ2x2LtMz3f9n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 02:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=<UNKNOWN>)
X-Greylist: delayed 411 seconds by postgrey-1.36 at boromir; Tue, 10 Jan 2023 02:36:28 AEDT
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrJ2N56Wlz2yJv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 02:36:28 +1100 (AEDT)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 5F8191223;
	Mon,  9 Jan 2023 16:29:30 +0100 (CET)
Received: from talos.danny.cz (unknown [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id B9792DA003;
	Mon,  9 Jan 2023 16:29:30 +0100 (CET)
Date: Mon, 9 Jan 2023 16:29:30 +0100
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [Skiboot] [PATCH 1/3] core/device: Add function to return child
 node using name and length
Message-Id: <20230109162930.13958ea565052acf4021feb8@danny.cz>
In-Reply-To: <90C3BC56-B51A-4FD7-8949-900E24EF34E8@linux.vnet.ibm.com>
References: <20230102151954.aae52c099e02ef3c4f22fd4e@danny.cz>
	<246510aa-76f6-f030-d89a-78ac45aef30c@linux.ibm.com>
	<90C3BC56-B51A-4FD7-8949-900E24EF34E8@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Athira,

On Thu, 5 Jan 2023 12:41:33 +0530
Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:

> 
> 
> > On 05-Jan-2023, at 12:35 PM, Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
> > 
> > 
> > On Mon,  2 Jan 2023 08:45:22 +0530
> > Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> > 
> >> Add a function dt_find_by_name_len() that returns the child node if
> >> it matches the first "n" characters of a given name, otherwise NULL.
> >> This is helpful for cases with node name like: "name@addr". In
> >> scenarios where nodes are added with "name@addr" format and if the
> >> value of "addr" is not known, that node can't be matched with node
> >> name or addr. Hence matching with substring as node name will return
> >> the expected result. Patch adds dt_find_by_name_len() function
> >> and testcase for the same in core/test/run-device.c
> > 
> > wouldn't it be better to automatically compare the name up to the "@"
> > character in the node name when searching for the match instead of
> > having to hard-code the lengths? I think it should be good enough for
> > the use case described above.
> > 
> > something like
> > ...
> > pos = strchr(child->name, '@')
> > if (!strncmp(child->name, name, pos - child->name))
> >  ...
> > 
> > 
> > 		Dan
> 
> Hi Dan,
> 
> Thanks for checking the patch.
> 
> Comparing upto "@" while searching for the match will restrict the string search only for patterns with "@".
> By having dt_find_by_name_len which uses length, will be useful for generic substring search for different patterns.
> So prefered to use length instead of hardcoding character.
> 
> Please let us know your thoughts.

I understand the presented solution is a pretty generic one, but I think
the question is whether the added complexity brings the benefits
compared to the simpler "separator char" solution.

And thinking even more about the generic "length" approach, it might
bring some false positive hits. Imagine nodes abc@1, abcd@2 and you are
looking for "abc". A search for (abc,3) will match also the "abcd"
one. And if the search string will always contain the "@" character,
then specifying the length is not required. And I believe the length
parameter might be totally redundant, because it can be derived from
the search string and the new function would be like
"dt_find_by_name_substr()".


	With regards,

		Dan

> Thanks
> Athira
> 
> > 
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >> core/device.c          | 20 ++++++++++++++++++++
> >> core/test/run-device.c | 11 +++++++++++
> >> include/device.h       |  4 ++++
> >> 3 files changed, 35 insertions(+)
> >> diff --git a/core/device.c b/core/device.c
> >> index 2de37c74..72c54e85 100644
> >> --- a/core/device.c
> >> +++ b/core/device.c
> >> @@ -395,6 +395,26 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
> >> }
> >>  +struct dt_node *dt_find_by_name_len(struct dt_node *root,
> >> +					const char *name, int len)
> >> +{
> >> +	struct dt_node *child, *match;
> >> +
> >> +	if (len <= 0)
> >> +		return NULL;
> >> +
> >> +	list_for_each(&root->children, child, list) {
> >> +		if (!strncmp(child->name, name, len))
> >> +			return child;
> >> +
> >> +		match = dt_find_by_name_len(child, name, len);
> >> +		if (match)
> >> +			return match;
> >> +	}
> >> +
> >> +	return NULL;
> >> +}
> >> +
> >> struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
> >> {
> >> 	struct dt_node *node = dt_find_by_name(parent, name);
> >> diff --git a/core/test/run-device.c b/core/test/run-device.c
> >> index 4a12382b..8c552103 100644
> >> --- a/core/test/run-device.c
> >> +++ b/core/test/run-device.c
> >> @@ -466,6 +466,17 @@ int main(void)
> >> 	new_prop_ph = dt_prop_get_u32(ut2, "something");
> >> 	assert(!(new_prop_ph == ev1_ph));
> >> 	dt_free(subtree);
> >> +
> >> +	/* Test dt_find_by_name_len */
> >> +	root = dt_new_root("");
> >> +	addr1 = dt_new_addr(root, "node", 0x1);
> >> +	addr2 = dt_new_addr(root, "node0_1", 0x2);
> >> +	assert(dt_find_by_name(root, "node@1") == addr1);
> >> +	assert(dt_find_by_name(root, "node0_1@2") == addr2);
> >> +	assert(dt_find_by_name_len(root, "node@", 5) == addr1);
> >> +	assert(dt_find_by_name_len(root, "node0_1@", 8) == addr2);
> >> +	dt_free(root);
> >> +
> >> 	return 0;
> >> }
> >> diff --git a/include/device.h b/include/device.h
> >> index 93fb90ff..f5e0fb79 100644
> >> --- a/include/device.h
> >> +++ b/include/device.h
> >> @@ -184,6 +184,10 @@ struct dt_node *dt_find_by_path(struct dt_node *root, const char *path);
> >> /* Find a child node by name */
> >> struct dt_node *dt_find_by_name(struct dt_node *root, const char *name);
> >> +/* Find a child node by name and len */
> >> +struct dt_node *dt_find_by_name_len(struct dt_node *root,
> >> +                                        const char *name, int len);
> >> +
> >> /* Find a node by phandle */
> >> struct dt_node *dt_find_by_phandle(struct dt_node *root, u32 phandle);
> >> -- 
> >> 2.27.0
> >> _______________________________________________
> >> Skiboot mailing list
> >> Skiboot@lists.ozlabs.org
> >> https://lists.ozlabs.org/listinfo/skiboot
> > _______________________________________________
> > Skiboot mailing list
> > Skiboot@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/skiboot
> 
