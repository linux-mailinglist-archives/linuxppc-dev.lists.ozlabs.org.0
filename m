Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21340EE6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 02:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9ZwW6BPLz30JK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 10:44:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9Zw139yBz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 10:44:11 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="286378579"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; 
 d="gz'50?scan'50,208,50";a="286378579"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 17:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; 
 d="gz'50?scan'50,208,50";a="699193870"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2021 17:43:04 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mR1y2-0001Zv-T2; Fri, 17 Sep 2021 00:43:02 +0000
Date: Fri, 17 Sep 2021 08:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] lib/zlib_inflate/inffast: Check config in C to avoid
 unused function warning
Message-ID: <202109170833.iTjOyEGE-lkp@intel.com>
References: <20210916142210.26722-1-pmenzel@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20210916142210.26722-1-pmenzel@molgen.mpg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, kbuild-all@lists.01.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.15-rc1 next-20210916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Paul-Menzel/lib-zlib_inflate-inffast-Check-config-in-C-to-avoid-unused-function-warning/20210916-222359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ff1ffd71d5f0612cf194f5705c671d6b64bf5f91
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/127eebd64d8e291cf75563499f6c886bd54a99d8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Paul-Menzel/lib-zlib_inflate-inffast-Check-config-in-C-to-avoid-unused-function-warning/20210916-222359
        git checkout 127eebd64d8e291cf75563499f6c886bd54a99d8
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nds32 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   lib/zlib_inflate/inffast.c: In function 'inflate_fast':
>> lib/zlib_inflate/inffast.c:257:39: error: 'CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS' undeclared (first use in this function)
     257 |                             *sout++ = CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS ? *sfrom++ : get_unaligned16(sfrom++);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zlib_inflate/inffast.c:257:39: note: each undeclared identifier is reported only once for each function it appears in


vim +/CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS +257 lib/zlib_inflate/inffast.c

    29	
    30	/*
    31	   Decode literal, length, and distance codes and write out the resulting
    32	   literal and match bytes until either not enough input or output is
    33	   available, an end-of-block is encountered, or a data error is encountered.
    34	   When large enough input and output buffers are supplied to inflate(), for
    35	   example, a 16K input buffer and a 64K output buffer, more than 95% of the
    36	   inflate execution time is spent in this routine.
    37	
    38	   Entry assumptions:
    39	
    40	        state->mode == LEN
    41	        strm->avail_in >= 6
    42	        strm->avail_out >= 258
    43	        start >= strm->avail_out
    44	        state->bits < 8
    45	
    46	   On return, state->mode is one of:
    47	
    48	        LEN -- ran out of enough output space or enough available input
    49	        TYPE -- reached end of block code, inflate() to interpret next block
    50	        BAD -- error in block data
    51	
    52	   Notes:
    53	
    54	    - The maximum input bits used by a length/distance pair is 15 bits for the
    55	      length code, 5 bits for the length extra, 15 bits for the distance code,
    56	      and 13 bits for the distance extra.  This totals 48 bits, or six bytes.
    57	      Therefore if strm->avail_in >= 6, then there is enough input to avoid
    58	      checking for available input while decoding.
    59	
    60	    - The maximum bytes that a single length/distance pair can output is 258
    61	      bytes, which is the maximum length that can be coded.  inflate_fast()
    62	      requires strm->avail_out >= 258 for each loop to avoid checking for
    63	      output space.
    64	
    65	    - @start:	inflate()'s starting value for strm->avail_out
    66	 */
    67	void inflate_fast(z_streamp strm, unsigned start)
    68	{
    69	    struct inflate_state *state;
    70	    const unsigned char *in;    /* local strm->next_in */
    71	    const unsigned char *last;  /* while in < last, enough input available */
    72	    unsigned char *out;         /* local strm->next_out */
    73	    unsigned char *beg;         /* inflate()'s initial strm->next_out */
    74	    unsigned char *end;         /* while out < end, enough space available */
    75	#ifdef INFLATE_STRICT
    76	    unsigned dmax;              /* maximum distance from zlib header */
    77	#endif
    78	    unsigned wsize;             /* window size or zero if not using window */
    79	    unsigned whave;             /* valid bytes in the window */
    80	    unsigned write;             /* window write index */
    81	    unsigned char *window;      /* allocated sliding window, if wsize != 0 */
    82	    unsigned long hold;         /* local strm->hold */
    83	    unsigned bits;              /* local strm->bits */
    84	    code const *lcode;          /* local strm->lencode */
    85	    code const *dcode;          /* local strm->distcode */
    86	    unsigned lmask;             /* mask for first level of length codes */
    87	    unsigned dmask;             /* mask for first level of distance codes */
    88	    code this;                  /* retrieved table entry */
    89	    unsigned op;                /* code bits, operation, extra bits, or */
    90	                                /*  window position, window bytes to copy */
    91	    unsigned len;               /* match length, unused bytes */
    92	    unsigned dist;              /* match distance */
    93	    unsigned char *from;        /* where to copy match from */
    94	
    95	    /* copy state to local variables */
    96	    state = (struct inflate_state *)strm->state;
    97	    in = strm->next_in;
    98	    last = in + (strm->avail_in - 5);
    99	    out = strm->next_out;
   100	    beg = out - (start - strm->avail_out);
   101	    end = out + (strm->avail_out - 257);
   102	#ifdef INFLATE_STRICT
   103	    dmax = state->dmax;
   104	#endif
   105	    wsize = state->wsize;
   106	    whave = state->whave;
   107	    write = state->write;
   108	    window = state->window;
   109	    hold = state->hold;
   110	    bits = state->bits;
   111	    lcode = state->lencode;
   112	    dcode = state->distcode;
   113	    lmask = (1U << state->lenbits) - 1;
   114	    dmask = (1U << state->distbits) - 1;
   115	
   116	    /* decode literals and length/distances until end-of-block or not enough
   117	       input data or output space */
   118	    do {
   119	        if (bits < 15) {
   120	            hold += (unsigned long)(*in++) << bits;
   121	            bits += 8;
   122	            hold += (unsigned long)(*in++) << bits;
   123	            bits += 8;
   124	        }
   125	        this = lcode[hold & lmask];
   126	      dolen:
   127	        op = (unsigned)(this.bits);
   128	        hold >>= op;
   129	        bits -= op;
   130	        op = (unsigned)(this.op);
   131	        if (op == 0) {                          /* literal */
   132	            *out++ = (unsigned char)(this.val);
   133	        }
   134	        else if (op & 16) {                     /* length base */
   135	            len = (unsigned)(this.val);
   136	            op &= 15;                           /* number of extra bits */
   137	            if (op) {
   138	                if (bits < op) {
   139	                    hold += (unsigned long)(*in++) << bits;
   140	                    bits += 8;
   141	                }
   142	                len += (unsigned)hold & ((1U << op) - 1);
   143	                hold >>= op;
   144	                bits -= op;
   145	            }
   146	            if (bits < 15) {
   147	                hold += (unsigned long)(*in++) << bits;
   148	                bits += 8;
   149	                hold += (unsigned long)(*in++) << bits;
   150	                bits += 8;
   151	            }
   152	            this = dcode[hold & dmask];
   153	          dodist:
   154	            op = (unsigned)(this.bits);
   155	            hold >>= op;
   156	            bits -= op;
   157	            op = (unsigned)(this.op);
   158	            if (op & 16) {                      /* distance base */
   159	                dist = (unsigned)(this.val);
   160	                op &= 15;                       /* number of extra bits */
   161	                if (bits < op) {
   162	                    hold += (unsigned long)(*in++) << bits;
   163	                    bits += 8;
   164	                    if (bits < op) {
   165	                        hold += (unsigned long)(*in++) << bits;
   166	                        bits += 8;
   167	                    }
   168	                }
   169	                dist += (unsigned)hold & ((1U << op) - 1);
   170	#ifdef INFLATE_STRICT
   171	                if (dist > dmax) {
   172	                    strm->msg = (char *)"invalid distance too far back";
   173	                    state->mode = BAD;
   174	                    break;
   175	                }
   176	#endif
   177	                hold >>= op;
   178	                bits -= op;
   179	                op = (unsigned)(out - beg);     /* max distance in output */
   180	                if (dist > op) {                /* see if copy from window */
   181	                    op = dist - op;             /* distance back in window */
   182	                    if (op > whave) {
   183	                        strm->msg = (char *)"invalid distance too far back";
   184	                        state->mode = BAD;
   185	                        break;
   186	                    }
   187	                    from = window;
   188	                    if (write == 0) {           /* very common case */
   189	                        from += wsize - op;
   190	                        if (op < len) {         /* some from window */
   191	                            len -= op;
   192	                            do {
   193	                                *out++ = *from++;
   194	                            } while (--op);
   195	                            from = out - dist;  /* rest from output */
   196	                        }
   197	                    }
   198	                    else if (write < op) {      /* wrap around window */
   199	                        from += wsize + write - op;
   200	                        op -= write;
   201	                        if (op < len) {         /* some from end of window */
   202	                            len -= op;
   203	                            do {
   204	                                *out++ = *from++;
   205	                            } while (--op);
   206	                            from = window;
   207	                            if (write < len) {  /* some from start of window */
   208	                                op = write;
   209	                                len -= op;
   210	                                do {
   211	                                    *out++ = *from++;
   212	                                } while (--op);
   213	                                from = out - dist;      /* rest from output */
   214	                            }
   215	                        }
   216	                    }
   217	                    else {                      /* contiguous in window */
   218	                        from += write - op;
   219	                        if (op < len) {         /* some from window */
   220	                            len -= op;
   221	                            do {
   222	                                *out++ = *from++;
   223	                            } while (--op);
   224	                            from = out - dist;  /* rest from output */
   225	                        }
   226	                    }
   227	                    while (len > 2) {
   228	                        *out++ = *from++;
   229	                        *out++ = *from++;
   230	                        *out++ = *from++;
   231	                        len -= 3;
   232	                    }
   233	                    if (len) {
   234	                        *out++ = *from++;
   235	                        if (len > 1)
   236	                            *out++ = *from++;
   237	                    }
   238	                }
   239	                else {
   240			    unsigned short *sout;
   241			    unsigned long loops;
   242	
   243	                    from = out - dist;          /* copy direct from output */
   244			    /* minimum length is three */
   245			    /* Align out addr */
   246			    if (!((long)(out - 1) & 1)) {
   247				*out++ = *from++;
   248				len--;
   249			    }
   250			    sout = (unsigned short *)(out);
   251			    if (dist > 2) {
   252				unsigned short *sfrom;
   253	
   254				sfrom = (unsigned short *)(from);
   255				loops = len >> 1;
   256				do
 > 257				    *sout++ = CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS ? *sfrom++ : get_unaligned16(sfrom++);
   258				while (--loops);
   259				out = (unsigned char *)sout;
   260				from = (unsigned char *)sfrom;
   261			    } else { /* dist == 1 or dist == 2 */
   262				unsigned short pat16;
   263	
   264				pat16 = *(sout-1);
   265				if (dist == 1) {
   266					union uu mm;
   267					/* copy one char pattern to both bytes */
   268					mm.us = pat16;
   269					mm.b[0] = mm.b[1];
   270					pat16 = mm.us;
   271				}
   272				loops = len >> 1;
   273				do
   274				    *sout++ = pat16;
   275				while (--loops);
   276				out = (unsigned char *)sout;
   277			    }
   278			    if (len & 1)
   279				*out++ = *from++;
   280	                }
   281	            }
   282	            else if ((op & 64) == 0) {          /* 2nd level distance code */
   283	                this = dcode[this.val + (hold & ((1U << op) - 1))];
   284	                goto dodist;
   285	            }
   286	            else {
   287	                strm->msg = (char *)"invalid distance code";
   288	                state->mode = BAD;
   289	                break;
   290	            }
   291	        }
   292	        else if ((op & 64) == 0) {              /* 2nd level length code */
   293	            this = lcode[this.val + (hold & ((1U << op) - 1))];
   294	            goto dolen;
   295	        }
   296	        else if (op & 32) {                     /* end-of-block */
   297	            state->mode = TYPE;
   298	            break;
   299	        }
   300	        else {
   301	            strm->msg = (char *)"invalid literal/length code";
   302	            state->mode = BAD;
   303	            break;
   304	        }
   305	    } while (in < last && out < end);
   306	
   307	    /* return unused bytes (on entry, bits < 8, so in won't go too far back) */
   308	    len = bits >> 3;
   309	    in -= len;
   310	    bits -= len << 3;
   311	    hold &= (1U << bits) - 1;
   312	
   313	    /* update state and return */
   314	    strm->next_in = in;
   315	    strm->next_out = out;
   316	    strm->avail_in = (unsigned)(in < last ? 5 + (last - in) : 5 - (in - last));
   317	    strm->avail_out = (unsigned)(out < end ?
   318	                                 257 + (end - out) : 257 - (out - end));
   319	    state->hold = hold;
   320	    state->bits = bits;
   321	    return;
   322	}
   323	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--d6Gm4EdcadzBjdND
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
6iPj+KsAAA==

--d6Gm4EdcadzBjdND--
